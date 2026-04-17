---
title: Modulo 05 - Adicionar Workers no Cluster
tags:
  - inovatech
  - chromecluster
  - docker
  - swarm
  - workers
status: em-andamento
---

# Módulo 05 - Adicionar Workers no Cluster

Guia para adicionar os Chromebooks ao cluster Docker Swarm como nós workers.

## Objetivo

Padronizar o processo de inclusão de workers no cluster, garantindo conectividade, segurança mínima e validação funcional.

## Sumário

1. [Pré-requisitos](#1-pré-requisitos)
2. [Método manual de join](#2-método-manual-de-join)
3. [Método automatizado com script](#3-método-automatizado-com-script)
4. [Validar nós no manager](#4-validar-nós-no-manager)
5. [Deploy de teste](#5-deploy-de-teste)
6. [Checklist de validação](#6-checklist-de-validação)
7. [Troubleshooting rápido](#7-troubleshooting-rápido)

---

## 1. Pré-requisitos

- Módulo 03 concluído em cada worker.
- Manager configurado no Módulo 04.
- Token de worker em mãos.
- Conectividade entre worker e manager na porta 2377.

---

## 2. Método manual de join

Em cada worker:

1. Instale Docker (se ainda não instalado):

   sudo apt update
   sudo apt install -y ca-certificates curl gnupg lsb-release
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt update
   sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
   sudo systemctl enable --now docker

2. Execute o comando de join gerado no manager:

   sudo docker swarm join --token <TOKEN_WORKER> <IP_MANAGER>:2377

3. Confirme estado local:

   sudo docker info | grep Swarm

---

## 3. Método automatizado com script

O projeto fornece um script para padronizar setup e join:

- Arquivo: ../scripts/setup_worker.sh

Execução local no worker:

   sudo bash setup_worker.sh --token <TOKEN_WORKER> --manager <IP_MANAGER>

Com NFS opcional:

   sudo bash setup_worker.sh --token <TOKEN_WORKER> --manager <IP_MANAGER> --nfs <IP_NFS>

Dica:
Copie o script para cada worker e execute com sudo.

---

## 4. Validar nós no manager

No manager, confira todos os nós:

   sudo docker node ls

Resultado esperado:

- Manager com STATUS Ready e AVAILABILITY Active.
- Workers com STATUS Ready.

---

## 5. Deploy de teste

No manager, faça um teste simples:

1. Criar serviço:

   sudo docker service create --name teste-nginx --replicas 2 -p 8080:80 nginx:alpine

2. Verificar tarefas:

   sudo docker service ls
   sudo docker service ps teste-nginx

3. Testar acesso em outro nó:

   curl http://<IP_DE_QUALQUER_NO>:8080

4. Remover serviço de teste:

   sudo docker service rm teste-nginx

---

## 6. Checklist de validação

- [ ] Todos os workers entraram no swarm.
- [ ] docker node ls mostra todos em Ready.
- [ ] Deploy de teste subiu sem falhas.
- [ ] Serviço responde na porta publicada.

---

## 7. Troubleshooting rápido

Join falha com token inválido:

- Gere token novo no manager:
  sudo docker swarm join-token worker

Worker já está em outro swarm:

- No worker:
  sudo docker swarm leave --force
- Refazer join com token atual.

Worker aparece Down:

- Verifique energia/rede do dispositivo.
- Confirme sincronização de hora e estabilidade do Wi-Fi.

---

## Próximo módulo

Após validar os workers, avance para [Módulo 06 - Operação, Monitoramento e Manutenção](./06-Operacao_Monitoramento_e_Manutencao.md).
