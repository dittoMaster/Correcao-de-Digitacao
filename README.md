# Inovatech ChromeCluster

![Primeira logo do projeto](./images/logo.png)

Projeto acadêmico para transformar Chromebooks em nós de um cluster Docker Swarm.

## Sumario de Modulos

1. [Modulo 01 - Desbloquear Chromebook](#modulo-01---desbloquear-chromebook)
2. [Modulo 02 - Criar ISO Ubuntu com pre-requisitos](#modulo-02---criar-iso-ubuntu-com-pre-requisitos)
3. [Modulo 03 - Instalar Ubuntu Server no Chromebook](#modulo-03---instalar-ubuntu-server-no-chromebook)
4. [Modulo 04 - Configurar Docker Swarm pai (manager)](#modulo-04---configurar-docker-swarm-pai-manager)
5. [Modulo 05 - Adicionar workers no cluster](#modulo-05---adicionar-workers-no-cluster)
6. [Modulo 06 - Operacao, monitoramento e manutencao](#modulo-06---operacao-monitoramento-e-manutencao)

## Modulo 01 - Desbloquear Chromebook

Objetivo: remover bloqueios fisicos e de firmware para permitir boot customizado.

Conteudo esperado:
- Remocao do parafuso de protecao (write-protect)
- Acesso aos modos de boot e recuperacao
- Instalar/validar firmware custom (MrChromebox)

Status: em construcao

## Modulo 02 - Criar ISO Ubuntu com pre-requisitos

Objetivo: preparar midia de instalacao do Ubuntu Server com os pacotes e configuracoes base do projeto.

Conteudo esperado:
- Download e validacao da ISO oficial
- Criacao de pendrive bootavel
- Lista de pre-requisitos (rede, disco, usuario, SSH, Docker)

Status: planejado

## Modulo 03 - Instalar Ubuntu Server no Chromebook

Objetivo: instalar o Ubuntu Server e validar o funcionamento inicial do hardware.

Conteudo atual:
- Guia inicial em docs com o passo a passo de instalacao

Referencia:
- [Como instalar Ubuntu Server no ChromeBook](./docs/Como%20instalar%20Ubuntu%20Server%20no%20ChromeBook.md)

Status: em andamento

## Modulo 04 - Configurar Docker Swarm pai (manager)

Objetivo: criar o no principal do Swarm e definir padroes de rede e seguranca.

Conteudo esperado:
- Instalacao do Docker Engine
- Inicializacao do cluster com docker swarm init
- Geracao de token de worker e boas praticas de acesso

Status: planejado

## Modulo 05 - Adicionar workers no cluster

Objetivo: conectar os Chromebooks ao Swarm como workers e validar a comunicacao.

Conteudo esperado:
- Processo de join de cada worker
- Validacoes com docker node ls e deploy de teste
- Checklist de troubleshooting

Status: planejado

## Modulo 06 - Operacao, monitoramento e manutencao

Objetivo: padronizar atualizacoes, observabilidade e recuperacao de falhas.

Conteudo esperado:
- Rotina de atualizacao dos nos
- Monitoramento basico de servicos
- Backup e plano de contingencia

Status: planejado

