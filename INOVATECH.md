---
title: Sobre o Inovatech
tags:
  - inovatech
  - unipar
  - extensao-universitaria
  - tecnologia
  - inovacao
  - empreendedorismo
---

# Centro de Tecnologia, Inovação e Empreendedorismo da Unipar — INOVATECH

## O que é o Inovatech

O INOVATECH é um projeto de extensão universitária da Universidade Paranaense (Unipar) com o propósito de **integrar tecnologia, inovação e empreendedorismo** como instrumentos para o desenvolvimento profissional dos acadêmicos e para o fortalecimento econômico da sociedade em que a instituição está inserida.

A iniciativa busca aproximar a Universidade do mercado, promovendo a conexão ativa entre academia e sociedade por meio do desenvolvimento de soluções em software, produtos e serviços inovadores, consultorias, e novos negócios de base tecnológica, além de estimular o perfil empreendedor dos participantes.

Diante da crescente demanda do mercado por profissionais qualificados, o INOVATECH se propõe a levar os acadêmicos ao enfrentamento de problemas reais, ao mesmo tempo em que insere as empresas no ambiente universitário por meio de parcerias e do atendimento a demandas concretas. Dessa forma, o projeto contribui para complementar a formação dos estudantes e dos participantes externos, oferecendo experiências práticas que ampliam competências técnicas, comportamentais e empreendedoras em um contexto multidisciplinar, interdisciplinar e transdisciplinar.

A iniciativa também contempla o atendimento de demandas relacionadas à tecnologia da informação da comunidade interna e externa, difundindo o uso de inovações tecnológicas e promovendo a integração entre universidade e sociedade. Entre suas ações estão o desenvolvimento de soluções inovadoras, a realização de capacitações, consultorias, implantações, suporte e manutenção em TI, além do estímulo à proatividade, criatividade, pesquisa e desenvolvimento.

## O espaço

O laboratório do Inovatech é um ambiente ativo de trabalho e pesquisa, equipado com bancadas, estações de trabalho e um acervo histórico de equipamentos de tecnologia — de microcomputadores dos anos 80 a notebooks modernos — que reforça a missão de conectar gerações de conhecimento tecnológico.

![Visão panorâmica do laboratório Inovatech](./images/fotos/panoramica%20da%20sala.jpeg)
*Visão geral do laboratório, com bancadas, armários e equipamentos em uso pela equipe.*

![Acervo histórico — painel 1](./images/fotos/sobre-o-local-1.jpeg)
*Parte do acervo de equipamentos históricos: monitores, teclados e microcomputadores das décadas de 70 a 90.*

![Acervo histórico — painel 2](./images/fotos/sobre-o-local-2.jpeg)
*Equipamentos como Hotbit HB-2400, IEE Micro F 325 e outros marcos da computação nacional preservados no espaço.*

![Acervo histórico — mesa de peças e periféricos](./images/fotos/sobre-o-local-3.jpeg)
*Mesa com fitas cassete, disquetes, memórias, computadores antigos e periféricos — parte do acervo de história da computação mantido pelo laboratório.*

## O projeto ChromeCluster

O **ChromeCluster** é um projeto desenvolvido dentro do Inovatech com o objetivo de dar uma segunda vida a um lote de Chromebooks Samsung ociosos, transformando-os em nós de um **cluster Docker Swarm** para uso acadêmico e experimental.

### Como surgiu

O laboratório dispunha de um lote expressivo de Chromebooks Samsung acumulados sem uso. O desafio foi encontrar uma forma de reaproveitar esses equipamentos de forma técnica e educativa, gerando valor real para a instituição.

![Pilha de Chromebooks Samsung aguardando o processo](./images/fotos/pilha-de-chromebooks.jpeg)
*Lote de Chromebooks Samsung reunidos no laboratório antes do início do processo de desbloqueio e reinstalação.*

### Início das pesquisas

A equipe iniciou as pesquisas sobre como desbloquear o firmware dos Chromebooks, instalar o Ubuntu Server e configurar o Docker Swarm. As referências foram buscadas em documentação técnica, fóruns e tutoriais especializados.

![Equipe iniciando as pesquisas](./images/fotos/Iniciando-pesquisas.jpeg)
*Estação de trabalho com pesquisas sobre Ubuntu Server 22.04, terminal ativo em um Chromebook e comunicação em tempo real pela equipe. Ao fundo, o lote de Chromebooks aguardando processamento.*

### Desbloqueio e instalação do firmware

O processo de desbloqueio envolveu entrar no modo desenvolvedor, instalar o firmware custom do MrChromebox e preparar o equipamento para boot via USB. Durante essa etapa, a equipe trabalhou em paralelo com múltiplos dispositivos.

![Chromebooks durante instalação do firmware e configuração](./images/fotos/devmode-firmware_install-not_apoio.jpeg)
*À esquerda, um Chromebook ainda na tela inicial do ChromeOS. Ao centro, instalação do firmware MrChromebox em andamento via terminal. À direita, notebook de apoio com comunicação da equipe via Discord.*

### Desafios encontrados — Problema com Wi-Fi

Um dos primeiros obstáculos enfrentados foi a ausência do serviço `network-manager` no Ubuntu Server mínimo instalado nos Chromebooks. O Wi-Fi não era reconhecido e comandos como `nmcli` retornavam erro, exigindo investigação e solução manual da equipe.

![Terminal exibindo erros de rede no Chromebook](./images/fotos/descoberta-do-problema-do-wifi.jpeg)
*Terminal do Chromebook exibindo erros: `nmcli: command not found`, `lwd: command not found` e `Failed to enable unit: network-manager.service does not exist` — descoberta do problema de Wi-Fi que exigiu solução da equipe.*

## Referências

- [Página oficial do Inovatech — Unipar](https://www.unipar.br/servicos/centro-de-tecnologia-inovacao-e-empreendedorismo-da-unipar-inovatech/)
- [Documentação MrChromebox](https://docs.mrchromebox.tech)
- [Guia do Módulo 01 — Desbloquear Chromebook](./docs/01-Desbloquear_Chromebook.md)
- [README do ChromeCluster](./README.md)
