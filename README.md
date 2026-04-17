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
  <img src="https://img.shields.io/badge/Scripts-01-E67E22?style=for-the-badge" alt="Scripts" />
  <img src="https://img.shields.io/badge/Status-Em%20Desenvolvimento-C0392B?style=for-the-badge" alt="Status" />
</p>

Projeto acadêmico do Inovatech/Unipar para reaproveitar Chromebooks Samsung como nós de um cluster [Docker Swarm](https://docs.docker.com/engine/swarm/) para uso em laboratório, ensino e experimentação prática.

## Visao geral

O projeto esta organizado em modulos progressivos, desde o desbloqueio do hardware ate a operacao do cluster em producao academica.

## Sumario de modulos

1. [Modulo 01 - Desbloquear Chromebook](#modulo-01---desbloquear-chromebook)
2. [Modulo 02 - Criar ISO Ubuntu com pre-requisitos](#modulo-02---criar-iso-ubuntu-com-pre-requisitos)
3. [Modulo 03 - Instalar Ubuntu Server no Chromebook](#modulo-03---instalar-ubuntu-server-no-chromebook)
4. [Modulo 04 - Configurar Docker Swarm pai (manager)](#modulo-04---configurar-docker-swarm-pai-manager)
5. [Modulo 05 - Adicionar workers no cluster](#modulo-05---adicionar-workers-no-cluster)
6. [Modulo 06 - Operacao, monitoramento e manutencao](#modulo-06---operacao-monitoramento-e-manutencao)

## Status rapido

| Modulo | Status |
| --- | --- |
| Modulo 01 | Em andamento |
| Modulo 02 | Em andamento |
| Modulo 03 | Em andamento |
| Modulo 04 | Em andamento |
| Modulo 05 | Em andamento |
| Modulo 06 | Em andamento |

## Modulo 01 - Desbloquear Chromebook

Objetivo: remover bloqueios fisicos e de firmware para permitir boot customizado.

Conteudo atual:

- Liberacao da trava de hardware
- Etapa de Powerwash
- Entrada em modo desenvolvedor
- Instalacao de firmware custom

Guia detalhado:

- [Abrir guia do Modulo 01](./docs/01-Desbloquear_Chromebook.md)

## Modulo 02 - Criar ISO Ubuntu com pre-requisitos

Objetivo: preparar midia de instalacao do Ubuntu Server com os pacotes e configuracoes base do projeto.

Conteudo atual:

- Instalacao e uso do Cubic
- Inclusao dos pacotes de rede (Wi-Fi)
- Validacao da ISO gerada

Guia detalhado:

- [Abrir guia do Modulo 02](./docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md)

## Modulo 03 - Instalar Ubuntu Server no Chromebook

Objetivo: instalar o Ubuntu Server e validar o funcionamento inicial do hardware.

Conteudo atual:

- Boot pela midia USB
- Instalacao base do sistema
- Checklist de validacao e troubleshooting

Guia detalhado:

- [Abrir guia do Modulo 03](./docs/03-Instalar_Ubuntu_Server_no_Chromebook.md)

## Modulo 04 - Configurar Docker Swarm pai (manager)

Objetivo: criar o no principal do Swarm e definir padroes de rede e seguranca.

Conteudo atual:

- Instalacao do Docker Engine
- Inicializacao do cluster com docker swarm init
- Geracao de token de worker e validacoes

Guia detalhado:

- [Abrir guia do Modulo 04](./docs/04-Configurar_Docker_Swarm_Manager.md)

## Modulo 05 - Adicionar workers no cluster

Objetivo: conectar os Chromebooks ao Swarm como workers e validar a comunicacao.

Conteudo atual:

- Processo manual de join de worker
- Processo automatizado com script
- Validacoes com docker node ls e deploy de teste

Guia detalhado:

- [Abrir guia do Modulo 05](./docs/05-Adicionar_Workers_no_Cluster.md)
- [Script de setup do worker](./scripts/setup_worker.sh)

## Modulo 06 - Operacao, monitoramento e manutencao

Objetivo: padronizar atualizacoes, observabilidade e recuperacao de falhas.

Conteudo atual:

- Rotina diaria, semanal e mensal de operacao
- Monitoramento basico de servicos
- Backup e plano de contingencia

Guia detalhado:

- [Abrir guia do Modulo 06](./docs/06-Operacao_Monitoramento_e_Manutencao.md)

## Proximos passos sugeridos

1. Validar os guias dos modulos 03 a 06 em bancada e ajustar detalhes praticos.
2. Completar capturas de tela do modulo 02.
3. Adicionar checklist de validacao ao fim de cada modulo conforme execucoes reais.

