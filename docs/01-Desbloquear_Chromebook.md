# // Inovatech | ChromeCluster. (Em Desenvolvimento)

## Guia da pré instalação dos chromebooks.
Guia de como desbloquear e liberar o firmware do chromebook para a instalção de outros sistemas operacionais.

## Passo a passo:
  - [Trava de Hardware](#//-liberar-a-trava-de-hardware)
  - [Modo Desenvolvedor](#//-entrando-em-modo-desenvolvedor)
  - [Powerwash]()
  - etc...

### // Liberar a trava de Hardware

1. **Remova os parafusos da traseira do notebook.**  
   **[Imagem Parafusos Traseiros]**

2. **Desencaixe a tampa traseira** puxando no vão da conexão com o monitor.  
   **[Imagem Vão Traseiro]**

3. **Remova a capa metálica e solte a placa:**  
   - Remova a capa metálica dos conectores (**amarelo**);  
   - Remova os parafusos da placa-mãe (**vermelho**);  
   - Desconecte os cabos (**verde**).  
   **[Imagem da placa de cima / em destaque: chapa metálica, parafusos e cabos]**

4. **Remova o parafuso da trava de hardware** (na parte de trás da placa-mãe).

   ![Foto tirada no inovatech](../images/docs/Como_instalar_Ubuntu_Server_no_ChromeBook/notebook_aberto.jpeg)  
   ![Foto Extraída da wiki do MrChromebox](../images/docs/Como_instalar_Ubuntu_Server_no_ChromeBook/verso_placa_mae.jpeg)

5. **Remonte tudo** e siga para o próximo passo.

### // Entrando em [Modo Desenvolvedor](https://docs.mrchromebox.tech/docs/boot-modes/developer.html)

### // Resetar o MDM (Mobile Device Management)

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
