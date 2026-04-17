---
title: Inovatech ChromeCluster
tags:
  - inovatech
  - chromecluster
  - chromebook
  - ubuntu-server
  - docker-swarm
status: em-desenvolvimento
---

# Inovatech ChromeCluster

![Logo do projeto](./images/logo.png)

Projeto academico do Inovatech/Unipar para reaproveitar Chromebooks Samsung como nós de um cluster [Docker Swarm](https://docs.docker.com/engine/swarm/) para uso em laboratorio e atividades de ensino.

## O que ja existe no repositorio

- Documentacao do modulo 01 (desbloqueio de Chromebook)
- Documentacao dos modulos 02 a 06 (ISO, instalacao, manager, workers e operacao)
- Diagramas de fluxo e sequencia do processo completo
- Script de automacao para preparar no worker e entrar no Swarm

## Estrutura rapida

- Guia institucional do projeto: [INOVATECH.md](./INOVATECH.md)
- Diagramas: [DIAGRAMA.MD](./DIAGRAMA.MD)
- Modulo 01: [docs/01-Desbloquear_Chromebook.md](./docs/01-Desbloquear_Chromebook.md)
- Modulo 02: [docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md](./docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md)
- Modulo 03: [docs/03-Instalar_Ubuntu_Server_no_Chromebook.md](./docs/03-Instalar_Ubuntu_Server_no_Chromebook.md)
- Modulo 04: [docs/04-Configurar_Docker_Swarm_Manager.md](./docs/04-Configurar_Docker_Swarm_Manager.md)
- Modulo 05: [docs/05-Adicionar_Workers_no_Cluster.md](./docs/05-Adicionar_Workers_no_Cluster.md)
- Modulo 06: [docs/06-Operacao_Monitoramento_e_Manutencao.md](./docs/06-Operacao_Monitoramento_e_Manutencao.md)
- Script worker: [scripts/setup_worker.sh](./scripts/setup_worker.sh)

## Roadmap de modulos

| Modulo | Objetivo | Status atual |
| --- | --- | --- |
| Modulo 01 - Desbloquear Chromebook | Liberar hardware e firmware para boot externo | Em andamento (guia detalhado disponivel) |
| Modulo 02 - Criar ISO Ubuntu com pre-requisitos | Preparar instalacao com suporte a Wi-Fi e pacotes base | Em andamento (guia inicial disponivel) |
| Modulo 03 - Instalar Ubuntu Server | Instalar e validar o sistema base nos Chromebooks | Em andamento (guia disponivel) |
| Modulo 04 - Configurar no manager | Inicializar o Docker Swarm e definir padroes | Em andamento (guia disponivel) |
| Modulo 05 - Adicionar workers | Conectar e validar todos os nos no cluster | Em andamento (guia e script disponiveis) |
| Modulo 06 - Operacao e manutencao | Definir rotina de update, monitoramento e backup | Em andamento (guia disponivel) |

## Fluxo resumido do projeto

1. Desmontar o Chromebook e remover write-protect.
2. Fazer Powerwash e liberar acesso ao modo desenvolvedor.
3. Instalar firmware custom do MrChromebox.
4. Criar midia Ubuntu Server customizada com suporte de rede.
5. Instalar Ubuntu Server no dispositivo.
6. Subir manager Swarm e gerar token.
7. Provisionar workers e validar cluster.

Consulte os diagramas em [DIAGRAMA.MD](./DIAGRAMA.MD) para visualizar o fluxo completo.

## Script de setup de worker

O repositorio possui um script de automacao para preparar um no worker Ubuntu e efetuar join no Swarm:

- Arquivo: [scripts/setup_worker.sh](./scripts/setup_worker.sh)
- Funcoes principais:
  - Atualizacao do sistema e instalacao de dependencias
  - Instalacao/configuracao do Docker
  - Otimizacoes para hardware limitado (swap off, zram, sysctl)
  - Configuracao de firewall e fail2ban
  - Join automatico no cluster

Uso basico:

```bash
sudo bash scripts/setup_worker.sh --token <TOKEN_SWARM> --manager <IP_MANAGER>
```

Opcionalmente, suporta NFS:

```bash
sudo bash scripts/setup_worker.sh --token <TOKEN_SWARM> --manager <IP_MANAGER> --nfs <IP_NFS>
```

## Referencias tecnicas

- [MrChromebox](https://docs.mrchromebox.tech)
- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Ubuntu Server](https://ubuntu.com/server/docs)

## Proximos passos recomendados

1. Revisar o modulo 02 (prints e passos faltantes).
2. Executar os novos guias dos modulos 03 a 06 em bancada e ajustar detalhes de campo.
3. Padronizar capturas de tela para os modulos 03, 04, 05 e 06.
4. Adicionar uma secao de FAQ com erros recorrentes do laboratorio.

