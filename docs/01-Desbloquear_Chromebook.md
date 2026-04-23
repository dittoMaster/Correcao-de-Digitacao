---
title: Modulo 01 - Desbloquear Chromebook
tags:
  - inovatech
  - chromecluster
  - chromebook
  - firmware
  - mrchromebox
status: em-andamento
---

# Módulo 01 - Desbloquear Chromebook

Guia de pré-instalação para desbloquear o Chromebook e liberar o firmware para boot de outros sistemas operacionais.

## Objetivo

Remover bloqueios físicos e de firmware para preparar o equipamento para a instalação do Ubuntu Server.

## Sumário

1. [Liberar a trava de hardware](#1-liberar-a-trava-de-hardware)
2. [Powerwash](#2-powerwash)
3. [Entrar em modo desenvolvedor](#3-entrar-em-modo-desenvolvedor)
4. [Instalar firmware custom](#4-instalar-firmware-custom)

---

## 1. Liberar a trava de hardware

1. **Remova os parafusos da tampa traseira do notebook.**
   ![Imagem parafusos traseiros](../images/docs/01/parafusos_traseiros.jpg)

2. **Desencaixe a tampa traseira** puxando no vão da conexão com o monitor.
   ![Imagem vão traseiro](../images/docs/01/vao_de_abertura.jpg)

3. **Remova a capa metálica e solte a placa:**
   - Remova a capa metálica dos conectores (amarelo).
   - Remova os parafusos da placa-mãe (vermelho).
   - Desconecte os cabos (verde).

> ⚠️ **Atenção:** não remova o cabo do monitor. Esse cabo é frágil e pode romper com facilidade.

   ![Imagem da placa de cima com destaque para chapa metálica, parafusos e cabos](../images/docs/01/visao_interna.jpg)

4. **Remova o parafuso da trava de hardware** (na parte traseira da placa-mãe).

   ![Foto tirada no Inovatech](../images/docs/01/notebook_aberto.jpeg)
   ![Foto extraída da wiki do MrChromebox](../images/docs/01/verso_placa_mae.jpeg)

5. **Remonte o equipamento** e avance para o próximo passo.

---

## 2. Powerwash

Alguns Chromebooks ainda têm a licença da universidade ativa. Nesses casos, ao ligar o dispositivo pela primeira vez, aparecerá uma mensagem informando que ele é gerenciado pela instituição. Basta aguardar — o dispositivo fará o Powerwash automaticamente, removendo essa licença e reiniciando.

Após a reinicialização, faremos login com a conta abaixo para resetar o MDM (Mobile Device Management) e liberar o acesso ao [Modo Desenvolvedor](https://docs.mrchromebox.tech/docs/boot-modes/developer.html):

| E-mail | Senha |
| :---: | :---: |
| i9chromecluster@gmail.com | Consultar com o André Codato ou algum professor |

**Passo a passo:**

1. Conecte o Chromebook ao Wi-Fi.
2. Inicie o dispositivo e conclua a configuração padrão com a conta acima.
3. Execute o Powerwash: **Configurações do sistema > Avançado > Redefinir configurações > Powerwash**.
4. O computador reiniciará e voltará à tela de login. **Não faça login.** Aguarde até aparecer uma janela de confirmação do Powerwash, aceite e siga para o próximo passo.

---

## 3. Entrar em modo desenvolvedor

Neste passo entraremos no modo de recuperação do dispositivo para ativar o Modo Desenvolvedor.

**Passo a passo:**

1. Inicie o Chromebook em modo de recuperação pressionando **ESC + Refresh + Power**, conforme a imagem:

   ![Imagem extraída da wiki do MrChromebox](../images/docs/01/recovery-keyboard-hint.png)

2. Na tela inicial do modo de recuperação, pressione **Ctrl + D** e confirme pressionando **ENTER**. O computador reiniciará e iniciará o processo para habilitar o Modo Desenvolvedor.

   **Modo Recuperação**
   ![Tela do modo recuperação](../images/docs/01/tela_modo_recuperacao.png)

3. Ao finalizar, o computador reiniciará e exibirá a tela de aviso abaixo. **Aguarde** — não toque em nada. O Chromebook apitará e sairá dessa tela automaticamente, iniciando normalmente.

4. Após a inicialização, o processo de configuração do dispositivo será exibido novamente. Conecte-se ao Wi-Fi e siga para o [próximo passo](#4-instalar-firmware-custom).

   **Modo Desenvolvimento**
   ![Aviso de segurança](../images/docs/01/aviso_seguranca.png)

**Referências oficiais:**
- [Modo de recuperação](https://docs.mrchromebox.tech/docs/boot-modes/recovery.html)
- [Modo desenvolvedor](https://docs.mrchromebox.tech/docs/boot-modes/developer.html)

---

## 4. Instalar firmware custom

Neste módulo desbloquearemos o firmware do Chromebook utilizando o [MrChromebox](https://mrchromebox.tech/), possibilitando a instalação de outros sistemas operacionais na máquina.

1. Com o Chromebook conectado ao Wi-Fi, pressione **Ctrl + Alt + F2** (no teclado do Chromebook, F2 é a seta para a direita "→") para abrir o terminal.

2. No terminal vai pedir um usuário, digite "chronos" e de ENTER

3. No terminal, digite o comando abaixo para baixar e executar o script de desbloqueio:

   ```bash
   curl -LOf https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh
   ```

4. No menu da ferramenta Firmware-Util, selecione a opção **2** e pressione **ENTER**. Responda às perguntas da seguinte forma:
   - Primeira pergunta: **Y**
   - Segunda pergunta: **Y**
   - Terceira pergunta: **N**

5. Aguarde a finalização do script. Ao retornar ao menu principal, pressione **P** para desligar o dispositivo.

Pronto — seu Chromebook está desbloqueado! ✅