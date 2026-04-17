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

<p align="center">
  <img src="./images/logo.png" alt="Logo do projeto" width="400" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Modulos-06-0A66C2?style=for-the-badge" alt="Modulos" />
  <img src="https://img.shields.io/badge/Guias-06-2E8B57?style=for-the-badge" alt="Guias" />
  <img src="https://img.shields.io/badge/Script%20Worker-01-E67E22?style=for-the-badge" alt="Script Worker" />
  <img src="https://img.shields.io/badge/Status-Em%20Desenvolvimento-C0392B?style=for-the-badge" alt="Status" />
</p>

Projeto acadêmico do Inovatech/Unipar para reaproveitar Chromebooks Samsung como nós de um cluster [Docker Swarm](https://docs.docker.com/engine/swarm/) para uso em laboratório, ensino e experimentação prática.

## Visão geral

O ChromeCluster organiza o processo em módulos progressivos:

1. Desbloqueio de hardware e firmware.
2. Criação de ISO Ubuntu Server com pré-requisitos.
3. Instalação do sistema base nos Chromebooks.
4. Bootstrap do manager Docker Swarm.
5. Entrada e validação dos workers.
6. Operação e manutenção do cluster.

## Mapa rápido do repositório

- Contexto institucional: [INOVATECH.md](./INOVATECH.md)
- Diagramas do fluxo: [DIAGRAMA.MD](./DIAGRAMA.MD)
- Script de provisionamento de worker: [scripts/setup_worker.sh](./scripts/setup_worker.sh)

Guias por módulo:

- [docs/01-Desbloquear_Chromebook.md](./docs/01-Desbloquear_Chromebook.md)
- [docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md](./docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md)
- [docs/03-Instalar_Ubuntu_Server_no_Chromebook.md](./docs/03-Instalar_Ubuntu_Server_no_Chromebook.md)
- [docs/04-Configurar_Docker_Swarm_Manager.md](./docs/04-Configurar_Docker_Swarm_Manager.md)
- [docs/05-Adicionar_Workers_no_Cluster.md](./docs/05-Adicionar_Workers_no_Cluster.md)
- [docs/06-Operacao_Monitoramento_e_Manutencao.md](./docs/06-Operacao_Monitoramento_e_Manutencao.md)

## Status dos módulos

| Módulo | Entrega | Situação |
| --- | --- | --- |
| 01 | Desbloquear Chromebook | Em andamento |
| 02 | Criar ISO customizada | Em andamento |
| 03 | Instalar Ubuntu Server | Em andamento |
| 04 | Configurar manager Swarm | Em andamento |
| 05 | Adicionar workers | Em andamento |
| 06 | Operar e manter cluster | Em andamento |

## Fluxo técnico resumido

1. Remover write-protect e ativar modo desenvolvedor.
2. Instalar firmware custom do MrChromebox.
3. Gerar ISO custom com suporte de rede para Chromebook.
4. Instalar Ubuntu Server e validar SSH/rede.
5. Inicializar o manager com `docker swarm init`.
6. Adicionar workers e validar com `docker node ls`.
7. Executar rotina de operação, atualização e contingência.

Para o fluxo completo em diagrama, consulte [DIAGRAMA.MD](./DIAGRAMA.MD).

## Setup rápido de worker

Comando básico:

```bash
sudo bash scripts/setup_worker.sh --token <TOKEN_SWARM> --manager <IP_MANAGER>
```

Com NFS opcional:

```bash
sudo bash scripts/setup_worker.sh --token <TOKEN_SWARM> --manager <IP_MANAGER> --nfs <IP_NFS>
```

O script automatiza atualização do sistema, instalação do Docker, ajustes para hardware limitado, firewall, fail2ban e join no swarm.

## Referências

- [MrChromebox Docs](https://docs.mrchromebox.tech)
- [Docker Swarm Docs](https://docs.docker.com/engine/swarm/)
- [Ubuntu Server Docs](https://ubuntu.com/server/docs)

## Próximos passos recomendados

1. Validar os módulos 03 a 06 em bancada e registrar ajustes práticos.
2. Completar capturas de tela do módulo 02 e padronizar imagens dos demais guias.
3. Adicionar uma seção FAQ com erros recorrentes e soluções rápidas.

