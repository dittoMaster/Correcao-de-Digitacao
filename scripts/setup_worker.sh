#!/bin/bash
# =============================================================================
# setup_worker.sh — Configuração automática de worker Docker Swarm
# Uso: curl -sL <url>/setup_worker.sh | sudo bash -s -- --token <TOKEN> --manager <IP>
# Ou:  sudo bash setup_worker.sh --token <TOKEN> --manager <IP>
# =============================================================================

set -euo pipefail

# -----------------------------------------------------------------------------
# CONFIGURAÇÕES — edite conforme seu ambiente
# -----------------------------------------------------------------------------
MANAGER_IP=""
SWARM_TOKEN=""
HOSTNAME_PREFIX="worker"
NFS_SERVER=""
NFS_MOUNT_PATH="/mnt/cluster"
LOG_FILE="/var/log/setup_worker.log"

# -----------------------------------------------------------------------------
# CORES E HELPERS
# -----------------------------------------------------------------------------
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; NC='\033[0m'; BOLD='\033[1m'

log()     { echo -e "${GREEN}[OK]${NC}  $1" | tee -a "$LOG_FILE"; }
warn()    { echo -e "${YELLOW}[AVISO]${NC} $1" | tee -a "$LOG_FILE"; }
error()   { echo -e "${RED}[ERRO]${NC} $1" | tee -a "$LOG_FILE"; exit 1; }
section() { echo -e "\n${BOLD}${BLUE}>>> $1${NC}" | tee -a "$LOG_FILE"; }

# -----------------------------------------------------------------------------
# PARSE DE ARGUMENTOS
# -----------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
    case "$1" in
        --token)   SWARM_TOKEN="$2";  shift 2 ;;
        --manager) MANAGER_IP="$2";   shift 2 ;;
        --nfs)     NFS_SERVER="$2";   shift 2 ;;
        --prefix)  HOSTNAME_PREFIX="$2"; shift 2 ;;
        --help)
            echo "Uso: sudo bash setup_worker.sh --token <TOKEN> --manager <IP> [--nfs <IP>]"
            exit 0 ;;
        *) error "Argumento desconhecido: $1" ;;
    esac
done

# -----------------------------------------------------------------------------
# VALIDAÇÕES INICIAIS
# -----------------------------------------------------------------------------
[[ $EUID -ne 0 ]] && error "Execute como root: sudo bash $0"
[[ -z "$MANAGER_IP" ]] && error "Informe o IP do manager: --manager <IP>"
[[ -z "$SWARM_TOKEN" ]] && error "Informe o token do Swarm: --token <TOKEN>"

mkdir -p "$(dirname "$LOG_FILE")"
echo "=== Setup iniciado em $(date) ===" >> "$LOG_FILE"

# -----------------------------------------------------------------------------
# 1. HOSTNAME ÚNICO BASEADO NO MAC
# -----------------------------------------------------------------------------
section "1/8 — Definindo hostname"

DEFAULT_IFACE=$(ip route show default | awk '/default/ {print $5}' | head -1)
MAC=$(cat /sys/class/net/${DEFAULT_IFACE}/address \
      | tr -d ':' | tail -c 6 | head -c 5)
NEW_HOSTNAME="${HOSTNAME_PREFIX}-${MAC}"

hostnamectl set-hostname "$NEW_HOSTNAME"
sed -i "s/127.0.1.1.*/127.0.1.1\t${NEW_HOSTNAME}/" /etc/hosts || \
    echo "127.0.1.1 ${NEW_HOSTNAME}" >> /etc/hosts

log "Hostname definido: $NEW_HOSTNAME (interface: $DEFAULT_IFACE)"

# -----------------------------------------------------------------------------
# 2. ATUALIZAÇÃO DO SISTEMA
# -----------------------------------------------------------------------------
section "2/8 — Atualizando sistema"

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -y -qq \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold"

log "Sistema atualizado"

# -----------------------------------------------------------------------------
# 3. DEPENDÊNCIAS BASE
# -----------------------------------------------------------------------------
section "3/8 — Instalando dependências"

apt-get install -y -qq \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    nfs-common \
    htop \
    net-tools \
    iotop \
    vim \
    ufw \
    fail2ban \
    zram-tools

log "Dependências instaladas"

# -----------------------------------------------------------------------------
# 4. DOCKER
# -----------------------------------------------------------------------------
section "4/8 — Instalando Docker"

if command -v docker &>/dev/null; then
    warn "Docker já instalado: $(docker --version). Pulando instalação."
    if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
        warn "Repositório oficial do Docker não encontrado — atualizações futuras podem falhar."
    fi
else
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
        https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" \
        | tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update -qq
    apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin

    systemctl enable docker
    systemctl start docker

    log "Docker instalado: $(docker --version)"
fi

# -----------------------------------------------------------------------------
# 5. OTIMIZAÇÕES DO SISTEMA PARA CLUSTER
# -----------------------------------------------------------------------------
section "5/8 — Aplicando otimizações"

# Desabilitar swap (obrigatório para Docker Swarm)
swapoff -a
sed -i '/swap/d' /etc/fstab
log "Swap desabilitado"

# ZRAM — importante para nós com 2GB e 4GB de RAM
# Usa 25% da RAM como swap comprimido em memória (lz4 = rápido)
if ! systemctl is-active --quiet zramswap 2>/dev/null; then
    cat > /etc/default/zramswap << 'EOF'
ALGO=lz4
PERCENT=25
EOF
    systemctl enable zramswap
    systemctl start zramswap
    log "ZRAM configurado (lz4, 25% da RAM)"
else
    warn "ZRAM já ativo. Pulando."
fi

# Parâmetros de kernel para networking de cluster
cat > /etc/sysctl.d/99-swarm.conf << 'EOF'
net.ipv4.ip_forward=1
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.core.somaxconn=65535
vm.swappiness=10
EOF
sysctl --system -q
log "Parâmetros de kernel aplicados"

# Journald leve — evita desperdício de RAM com logs
if ! grep -q "Storage=volatile" /etc/systemd/journald.conf 2>/dev/null; then
    cat >> /etc/systemd/journald.conf << 'EOF'
Storage=volatile
RuntimeMaxUse=32M
EOF
    systemctl restart systemd-journald
    log "Journald otimizado (volatile, 32MB)"
fi

# Blacklist de módulos desnecessários em workers headless
cat > /etc/modprobe.d/blacklist-cluster.conf << 'EOF'
blacklist bluetooth
blacklist btusb
blacklist uvcvideo
blacklist snd_hda_intel
EOF
log "Módulos desnecessários desabilitados"

# Firewall — portas necessárias para o Swarm
ufw --force enable
ufw allow ssh
ufw allow 2376/tcp   # Docker daemon TLS
ufw allow 2377/tcp   # Swarm cluster management
ufw allow 7946/tcp   # Node communication
ufw allow 7946/udp
ufw allow 4789/udp   # Overlay network (VXLAN)
log "Firewall configurado"

# -----------------------------------------------------------------------------
# 6. MONTAGEM NFS (opcional)
# -----------------------------------------------------------------------------
section "6/8 — Configurando NFS"

if [[ -n "$NFS_SERVER" ]]; then
    mkdir -p "$NFS_MOUNT_PATH"

    if ping -c 1 -W 2 "$NFS_SERVER" &>/dev/null; then
        if ! grep -q "$NFS_SERVER" /etc/fstab; then
            echo "${NFS_SERVER}:/cluster  ${NFS_MOUNT_PATH}  nfs  defaults,_netdev,nofail  0  0" \
                >> /etc/fstab
        fi
        mount -a 2>/dev/null \
            && log "NFS montado em $NFS_MOUNT_PATH" \
            || warn "NFS configurado no fstab mas falhou ao montar agora"
    else
        warn "NFS server $NFS_SERVER inacessível. Configuração pulada."
    fi
else
    warn "NFS não configurado (use --nfs <IP> para ativar)"
fi

# -----------------------------------------------------------------------------
# 7. FAIL2BAN
# -----------------------------------------------------------------------------
section "7/8 — Configurando Fail2ban"

if systemctl is-active --quiet fail2ban 2>/dev/null; then
    warn "Fail2ban já ativo. Pulando."
else
    systemctl enable fail2ban
    systemctl start fail2ban
    log "Fail2ban ativo"
fi

# -----------------------------------------------------------------------------
# 8. ENTRAR NO SWARM
# -----------------------------------------------------------------------------
section "8/8 — Entrando no Docker Swarm"

if docker info 2>/dev/null | grep -q "Swarm: active"; then
    warn "Este nó já faz parte de um Swarm. Pulando."
else
    if ! curl -sf --connect-timeout 5 "http://${MANAGER_IP}:2377" &>/dev/null; then
        warn "Manager em $MANAGER_IP pode estar inacessível na porta 2377 — tentando mesmo assim..."
    fi

    docker swarm join \
        --token "$SWARM_TOKEN" \
        "${MANAGER_IP}:2377" \
        && log "Worker entrou no Swarm com sucesso!" \
        || error "Falha ao entrar no Swarm. Verifique o token e o IP do manager."
fi

# -----------------------------------------------------------------------------
# 8. Desabilitar suspensão ao fechar a tampa
# -----------------------------------------------------------------------------
sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.bak && \
sudo sed -i 's/^#\?HandleLidSwitch=.*/HandleLidSwitch=ignore/' /etc/systemd/logind.conf && \
sudo sed -i 's/^#\?HandleLidSwitchDocked=.*/HandleLidSwitchDocked=ignore/' /etc/systemd/logind.conf && \
sudo sed -i 's/^#\?HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignore/' /etc/systemd/logind.conf && \
sudo systemctl restart systemd-logind && \
echo "Lid switch desabilitado para evitar suspensão ao fechar a tampa." | tee -a "$LOG_FILE"

# -----------------------------------------------------------------------------
# RESUMO FINAL
# -----------------------------------------------------------------------------
RAM_TOTAL=$(free -m | awk '/^Mem:/{print $2}')
ZRAM_STATUS=$(systemctl is-active zramswap 2>/dev/null || echo "inativo")

echo ""
echo -e "${BOLD}${GREEN}============================================${NC}"
echo -e "${BOLD}${GREEN}  Setup concluído: $NEW_HOSTNAME${NC}"
echo -e "${BOLD}${GREEN}============================================${NC}"
echo -e "  Manager:   ${MANAGER_IP}"
echo -e "  Docker:    $(docker --version | cut -d' ' -f3 | tr -d ',')"
echo -e "  Swarm:     $(docker info 2>/dev/null | grep 'Swarm:' | xargs)"
echo -e "  RAM total: ${RAM_TOTAL} MB"
echo -e "  ZRAM:      ${ZRAM_STATUS}"
echo -e "  Log:       $LOG_FILE"
echo ""
echo -e "${YELLOW}No manager, verifique com: docker node ls${NC}"
echo ""