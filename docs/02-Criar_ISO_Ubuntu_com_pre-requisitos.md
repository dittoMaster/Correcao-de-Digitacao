---
title: Modulo 02 - Criar ISO Ubuntu com pré-requisitos
tags:
  - inovatech
  - chromecluster
  - chromebook
  - server
  - ubuntu
status: em-andamento
---

# Módulo 02 - Criar ISO Ubuntu com Pré Requisitos

Guia de criação da iso customizada via [cubic](https://github.com/PJ-Singh-001/Cubic).

## Objetivo

A instalação padrão do Ubuntu Server não inclui, em alguns cenários, os pacotes necessários para uso de Wi-Fi logo no primeiro boot. Como os Chromebooks do projeto não possuem porta Ethernet, precisamos customizar a ISO para incluir os pacotes de rede.

## Sumário

1. [Instalar cubic](#1-instalar-cubic)
2. [Fazer a custom-iso](#2-fazer-a-custom-iso)
3. [Validar a ISO gerada](#3-validar-a-iso-gerada)

## 1. Instalar cubic
<img src="../images/docs/02/cubic-logo.png" width=100/>


O Cubic pode ser instalado facilmente no Ubuntu:

  - Ubuntu 18.04.5 Bionic Beaver e mais atuais.

![Logo do ubuntu](../images/docs/02/ubuntu-logo.png) **Ubuntu e derivados**

```bash
sudo apt-add-repository universe
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends cubic
```

## 2. Fazer a custom-iso

1. Abra o Cubic e, na tela inicial, selecione uma pasta de projeto (exemplo: `~/cubic/chromecluster`) e clique em **Avançar**.

2. Em **Original Disk**, selecione o arquivo ISO original do Ubuntu Server LTS.

3. Em **Custom Disk**, defina o nome da nova imagem (exemplo: `ubuntu-server-chromecluster.iso`) e avance.

4. Aguarde o Cubic extrair o conteúdo da ISO e abrir o terminal interno do ambiente de customização.

5. No terminal do Cubic, atualize os índices de pacotes:

```bash
apt update
```

6. Instale os pacotes obrigatórios para rede sem fio:

```bash
apt install -y network-manager wpasupplicant wireless-tools
```

7. Instale pacotes utilitários recomendados para o projeto:

```bash
apt install -y openssh-server curl ca-certificates net-tools vim htop
```

8. Habilite o NetworkManager para iniciar automaticamente no sistema instalado:

```bash
systemctl enable NetworkManager
```

9. Limpe cache para reduzir o tamanho da ISO final:

```bash
apt clean
rm -rf /var/lib/apt/lists/*
```

10. Clique em **Next** no Cubic para voltar às telas de configuração da imagem.

11. Revise metadados (nome, versão e descrição) para identificar que esta é a ISO do projeto ChromeCluster.

12. Na etapa final, clique em **Generate** e aguarde a criação do arquivo ISO customizado.

13. Ao concluir, salve a ISO em local de fácil acesso para gravação em pendrive bootável.

## 3. Validar a ISO gerada

Antes de usar em produção de bancada:

1. Faça um boot de teste da ISO em um equipamento de validação.
2. Confirme que o sistema inicia normalmente até o instalador.
3. Após instalação de teste, valide os pacotes:

```bash
dpkg -l | grep -E "network-manager|wpasupplicant|wireless-tools"
```

4. Verifique se o gerenciador de rede está ativo:

```bash
systemctl status NetworkManager
```

5. Se tudo estiver correto, use a ISO para instalar os Chromebooks no módulo seguinte.

---

## Próximo módulo

Com a ISO pronta e validada, siga para [Módulo 03 - Instalar Ubuntu Server no Chromebook](./03-Instalar_Ubuntu_Server_no_Chromebook.md).

