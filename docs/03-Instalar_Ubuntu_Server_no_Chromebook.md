---
title: Modulo 03 - Instalar Ubuntu Server no Chromebook
tags:
  - inovatech
  - chromecluster
  - chromebook
  - ubuntu-server
  - instalacao
status: em-andamento
---

# Módulo 03 - Instalar Ubuntu Server no Chromebook

Guia para instalar o Ubuntu Server no Chromebook já desbloqueado e preparar o nó base para entrar no cluster.

## Objetivo

Realizar a instalação limpa do Ubuntu Server, validar rede, SSH e requisitos mínimos para seguir com Docker Swarm.

## Sumário

1. [Pré-requisitos](#1-pré-requisitos)
2. [Boot pela mídia USB](#2-boot-pela-mídia-usb)
3. [Instalação do Ubuntu Server](#3-instalação-do-ubuntu-server)
4. [Pós-instalação imediata](#4-pós-instalação-imediata)
5. [Checklist de validação](#5-checklist-de-validação)
6. [Troubleshooting rápido](#6-troubleshooting-rápido)

---

## 1. Pré-requisitos

Antes de começar:

- Módulo 01 concluído (firmware custom instalado).
- Mídia USB preparada no Módulo 02.
- Acesso a Wi-Fi disponível.
- Fonte de alimentação conectada no Chromebook.

Recomendado:

- Ubuntu Server LTS (22.04 ou superior).
- Nome de host padrão por bancada (ex.: chromebook-01).

---

## 2. Boot pela mídia USB

1. Conecte o pendrive com a ISO no Chromebook desligado.
2. Ligue o dispositivo e acesse o menu de boot do firmware custom.
3. Selecione o pendrive USB como dispositivo de inicialização.
4. Aguarde carregar o instalador do Ubuntu Server.

Se o pendrive não aparecer:

- Teste outra porta USB.
- Regrave a mídia (Módulo 02).
- Confirme se a ISO usada é de Ubuntu Server.

---

## 3. Instalação do Ubuntu Server

No instalador:

1. Selecione idioma e layout de teclado.
2. Configure rede:
   - Se houver Ethernet, pode usar temporariamente.
   - Em Chromebooks sem Ethernet, continue e finalize a configuração de Wi-Fi no pós-instalação.
3. Defina armazenamento:
   - Opção padrão guiada é suficiente para os nós de laboratório.
4. Crie usuário administrativo:
   - Nome do usuário (ex.: inovatech)
   - Senha forte
5. Instale OpenSSH Server quando o instalador oferecer essa opção.
6. Finalize a instalação e reinicie removendo o pendrive.

---

## 4. Pós-instalação imediata

Após o primeiro boot, execute:

1. Atualizar pacotes:

   sudo apt update && sudo apt upgrade -y

2. Instalar utilitários básicos:

   sudo apt install -y curl ca-certificates net-tools htop vim

3. Validar rede:

   ip a
   ip route
   ping -c 3 8.8.8.8

4. Validar acesso SSH local:

   sudo systemctl status ssh

Observação:
Se o Wi-Fi não estiver funcional, valide se os pacotes planejados no Módulo 02 foram incluídos na ISO e confira o módulo de rede antes de seguir.

---

## 5. Checklist de validação

Marque todos os itens antes de seguir para o Módulo 04:

- [ ] Sistema inicializa sem pendrive.
- [ ] Usuário administrativo criado e funcional.
- [ ] Rede com acesso à internet funcionando.
- [ ] Serviço SSH ativo.
- [ ] Sistema atualizado (apt update/upgrade).
- [ ] Horário do sistema correto.

---

## 6. Troubleshooting rápido

Instalador não inicia:

- Refaça boot pelo menu do firmware custom.
- Regrave o pendrive em outro dispositivo.

Sem rede após instalação:

- Verifique interface com ip a.
- Reinstale pacotes de rede:
  sudo apt install -y network-manager wpasupplicant wireless-tools
- Reinicie:
  sudo reboot

SSH não sobe:

- Instale/reative:
  sudo apt install -y openssh-server
  sudo systemctl enable --now ssh

---

## Próximo módulo

Após validar o nó base, continue em [Módulo 04 - Configurar Docker Swarm Manager](./04-Configurar_Docker_Swarm_Manager.md).
