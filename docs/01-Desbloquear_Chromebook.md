# Projeto Inovatech ChromeCluster.

## Guia da pré instalação dos chromebooks.
Guia de como desbloquear e liberar o firmware do chromebook para a instalção de outros sistemas operacionais.

## Primeiros passos:

1. ### Liberar a trava de Hardware.

	1.1<br/>
	- Remova os parafusos da traseira do notebook<br/>
		**[Imagem Parafusos Traseiros]**<br/>
	1.2<br/>
   	- Desencaixe a tampa traseira puxando no vão da conexão com o monitor.<br/>
		**[Imagem Vão Trazeiro]**<br/>
	1.3<br/>
   	- Remova a capa metálica dos conectores (Amarelo), os parafusos da placa mãe (Vermelho) e os cabos conectados (Verde).<br/>
		**[Imagem da placa de cima / em destaque: chapa metálica, parafusos e cabos]**<br/>
	1.4<br/>
   	- Remova o parafuso que faz a trava de hardware de trás da placa mãe.<br/>

![Foto tirada no inovatech](../images/docs/Como_instalar_Ubuntu_Server_no_ChromeBook/notebook_aberto.jpeg)
![Foto Extraída da wiki do MrChromebox](../images/docs/Como_instalar_Ubuntu_Server_no_ChromeBook/verso_placa_mae.jpeg)

	1.5<br/>
	- Remonte tudo e siga para o proximo passo.

2. ### Resetar o MDM (Mobile Device Management)

Para resetar o MDM (Mobile Device Management), precisamos fazer login com a conta google abaixo e seguir os passos seguintes:  
	

| E-mail | Senha |
| :---: | :---: |
| i9chromecluster@gmail.com | Consultar com o professor |

1. Conecte ao wi-fi.  
2. Inicie o dispositivo normalmente e faça a configuração padrão logando com a conta acima e senha.  
3. Fazer o Powerwash (Configurações do sistema \> Avançado \> Redefinir Configurações \> Powerwash)  
4. Quando o Powerwash acabar, siga os passos abaixo.

Inicie o Chromebook em [Modo de Rocuperação](https://docs.mrchromebox.tech/docs/boot-modes/recovery.html).  
Pressione Ctrl \+ Refresh \+ Power como na foto exemplo  
![Imagem extraída da wiki do MrChromebox](../images/docs/Como_instalar_Ubuntu_Server_no_ChromeBook/recovery-keyboard-hint.png)
