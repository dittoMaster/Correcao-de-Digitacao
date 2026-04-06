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

![Primeira logo do projeto](./images/logo.png)

Projeto academico para transformar Chromebooks em nos de um cluster Docker Swarm.

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
| Modulo 02 | Planejado |
| Modulo 03 | Em andamento |
| Modulo 04 | Planejado |
| Modulo 05 | Planejado |
| Modulo 06 | Planejado |

## Modulo 01 - Desbloquear Chromebook

Objetivo: remover bloqueios fisicos e de firmware para permitir boot customizado.

Conteudo atual:

- Liberacao da trava de hardware
- Etapa de Powerwash
- Entrada em modo desenvolvedor
- Estrutura inicial da secao de firmware custom

Guia detalhado:

- [Abrir guia do Modulo 01](./docs/01-Desbloquear_Chromebook.md)

## Modulo 02 - Criar ISO Ubuntu com pre-requisitos

Objetivo: preparar midia de instalacao do Ubuntu Server com os pacotes e configuracoes base do projeto.

Conteudo esperado:

- Download e validacao da ISO oficial
- Criacao de pendrive bootavel
- Lista de pre-requisitos (rede, disco, usuario, SSH, Docker)

Guia detalhado:

- [Abrir guia do Modulo 02](./docs/02-Criar_ISO_Ubuntu_com_pre-requisitos.md)

## Modulo 03 - Instalar Ubuntu Server no Chromebook

Objetivo: instalar o Ubuntu Server e validar o funcionamento inicial do hardware.

Conteudo atual:

- Guia inicial em docs com o passo a passo de instalacao

## Modulo 04 - Configurar Docker Swarm pai (manager)

Objetivo: criar o no principal do Swarm e definir padroes de rede e seguranca.

Conteudo esperado:

- Instalacao do Docker Engine
- Inicializacao do cluster com docker swarm init
- Geracao de token de worker e boas praticas de acesso

## Modulo 05 - Adicionar workers no cluster

Objetivo: conectar os Chromebooks ao Swarm como workers e validar a comunicacao.

Conteudo esperado:

- Processo de join de cada worker
- Validacoes com docker node ls e deploy de teste
- Checklist de troubleshooting

## Modulo 06 - Operacao, monitoramento e manutencao

Objetivo: padronizar atualizacoes, observabilidade e recuperacao de falhas.

Conteudo esperado:

- Rotina de atualizacao dos nos
- Monitoramento basico de servicos
- Backup e plano de contingencia

## Proximos passos sugeridos

1. Finalizar a secao de firmware custom no Modulo 01.
2. Criar o guia completo do Modulo 02.
3. Adicionar checklist de validacao ao fim de cada modulo.

