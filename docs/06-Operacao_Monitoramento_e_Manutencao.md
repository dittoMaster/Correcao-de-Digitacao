---
title: Modulo 06 - Operacao, Monitoramento e Manutencao
tags:
  - inovatech
  - chromecluster
  - operacao
  - monitoramento
  - manutencao
status: em-andamento
---

# Módulo 06 - Operação, Monitoramento e Manutenção

Guia operacional para manter o cluster estável, atualizado e com recuperação rápida em laboratório.

## Objetivo

Definir uma rotina prática de operação contínua do cluster: inspeção diária, atualizações, monitoramento e contingência.

## Sumário

1. [Rotina diária](#1-rotina-diária)
2. [Rotina semanal](#2-rotina-semanal)
3. [Rotina mensal](#3-rotina-mensal)
4. [Monitoramento mínimo recomendado](#4-monitoramento-mínimo-recomendado)
5. [Backup e contingência](#5-backup-e-contingência)
6. [Checklist operacional](#6-checklist-operacional)
7. [Troubleshooting rápido](#7-troubleshooting-rápido)

---

## 1. Rotina diária

No manager:

1. Verificar nós:

   sudo docker node ls

2. Verificar serviços:

   sudo docker service ls

3. Verificar tarefas com falha:

   sudo docker service ps <NOME_DO_SERVICO>

Em cada nó crítico:

- Conferir uso de CPU/RAM/disco:
  htop
  df -h

---

## 2. Rotina semanal

1. Aplicar atualizações de segurança em janela de manutenção:

   sudo apt update && sudo apt upgrade -y

2. Reiniciar nós quando necessário (de forma controlada).
3. Validar retorno dos nós ao cluster após reboot.
4. Revisar logs recentes:

   sudo journalctl -p 3 -xb

---

## 3. Rotina mensal

1. Revisar capacidade:

- Número de nós ativos.
- Consumo médio de recursos.
- Serviços com maior uso.

2. Revisar hardening básico:

- SSH somente para usuários autorizados.
- Firewall ativo (UFW).
- fail2ban ativo.

3. Testar plano de recuperação:

- Simular perda de um worker.
- Validar realocação das réplicas.

---

## 4. Monitoramento mínimo recomendado

Itens essenciais:

- Estado dos nós (Ready/Down).
- Estado dos serviços (replicas em execução).
- Latência/rede entre manager e workers.
- Uso de disco para evitar interrupções por falta de espaço.

Ferramentas simples sugeridas para início:

- docker node ls
- docker service ls
- journalctl
- htop

---

## 5. Backup e contingência

Recomendações:

1. Manter backup versionado dos arquivos de configuração dos serviços.
2. Registrar inventário dos nós (hostname, IP, função).
3. Documentar procedimento de reinstalação rápida de worker.
4. Armazenar scripts do projeto em repositório remoto.

Para serviços com dados persistentes:

- Usar volumes nomeados ou NFS.
- Garantir backup periódico dos dados externos ao container.

---

## 6. Checklist operacional

- [ ] Todos os nós em Ready.
- [ ] Serviços críticos com réplicas saudáveis.
- [ ] Atualizações aplicadas na última janela.
- [ ] Espaço em disco dentro do limite seguro.
- [ ] Plano de contingência revisado.
- [ ] Logs sem erros críticos recorrentes.

---

## 7. Troubleshooting rápido

Nó em Down:

- Verifique alimentação elétrica e rede.
- Reinicie o Docker:
  sudo systemctl restart docker
- Se necessário, remover e readicionar o worker ao swarm.

Serviço não escala:

- Verifique recursos disponíveis nos workers.
- Confirme constraints e portas em conflito.

Problemas frequentes de Wi-Fi:

- Revalidar qualidade de sinal na bancada.
- Padronizar canais e distância do roteador para os nós.

---

## Encerramento

Com este módulo, o ciclo base do projeto ChromeCluster fica completo: desbloqueio, instalação, clusterização e operação.
