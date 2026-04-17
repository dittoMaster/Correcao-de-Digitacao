---
title: Modulo 04 - Configurar Docker Swarm Manager
tags:
  - inovatech
  - chromecluster
  - docker
  - swarm
  - manager
status: em-andamento
---

# Módulo 04 - Configurar Docker Swarm Manager

Guia para preparar o nó principal (manager) do cluster Docker Swarm.

## Objetivo

Instalar o Docker Engine no nó manager, inicializar o Swarm e gerar os tokens de entrada dos workers.

## Sumário

1. [Pré-requisitos](#1-pré-requisitos)
2. [Instalar Docker Engine](#2-instalar-docker-engine)
3. [Inicializar o Swarm](#3-inicializar-o-swarm)
4. [Abrir portas e validações de rede](#4-abrir-portas-e-validações-de-rede)
5. [Gerar comandos de join](#5-gerar-comandos-de-join)
6. [Checklist de validação](#6-checklist-de-validação)
7. [Troubleshooting rápido](#7-troubleshooting-rápido)

---

## 1. Pré-requisitos

- Módulo 03 concluído no nó que será manager.
- IP fixo ou reserva DHCP para o manager.
- Acesso à internet para instalar dependências.

Recomendação de hostname:

- manager-01

---

## 2. Instalar Docker Engine

No manager, execute:

1. Atualizar sistema:

   sudo apt update && sudo apt upgrade -y

2. Instalar dependências:

   sudo apt install -y ca-certificates curl gnupg lsb-release

3. Adicionar chave e repositório do Docker:

   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

4. Instalar Docker:

   sudo apt update
   sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

5. Habilitar serviço:

   sudo systemctl enable --now docker

6. Testar:

   sudo docker version

---

## 3. Inicializar o Swarm

1. Descubra o IP principal do manager:

   ip -4 a

2. Inicialize o cluster (troque pelo IP correto):

   sudo docker swarm init --advertise-addr <IP_DO_MANAGER>

3. Verifique estado do Swarm:

   sudo docker info | grep Swarm

---

## 4. Abrir portas e validações de rede

Portas mínimas para Swarm:

- 2377/tcp (cluster management)
- 7946/tcp e 7946/udp (comunicação entre nós)
- 4789/udp (overlay network)

Se usar UFW:

   sudo ufw allow 2377/tcp
   sudo ufw allow 7946/tcp
   sudo ufw allow 7946/udp
   sudo ufw allow 4789/udp
   sudo ufw allow ssh

---

## 5. Gerar comandos de join

No manager:

1. Token de worker:

   sudo docker swarm join-token worker

2. Token de manager adicional (opcional):

   sudo docker swarm join-token manager

Guarde os comandos com segurança e use o token de worker no Módulo 05.

---

## 6. Checklist de validação

- [ ] Docker ativo no manager.
- [ ] Swarm inicializado com sucesso.
- [ ] Portas do cluster liberadas.
- [ ] Token de worker gerado.
- [ ] Manager aparece como Leader em docker node ls.

Comando de validação:

   sudo docker node ls

---

## 7. Troubleshooting rápido

Erro de init por IP incorreto:

- Saia do swarm e reinicialize:
  sudo docker swarm leave --force
  sudo docker swarm init --advertise-addr <IP_CORRETO>

Worker não conecta:

- Teste conectividade entre worker e manager (porta 2377).
- Revise firewall do manager.
- Gere novo token se necessário.

---

## Próximo módulo

Com o manager pronto, siga para [Módulo 05 - Adicionar Workers no Cluster](./05-Adicionar_Workers_no_Cluster.md).
