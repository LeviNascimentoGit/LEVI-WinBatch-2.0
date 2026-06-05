	@echo off
	color 3
	mode con: cols=150 lines=43
	chcp 65001 >nul
	set res="" 
	set linha=echo ________________________________________________________________________________________________________________________________________________

REM 	Verifica se o usuário está executando o arquivo como administrador
	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
echo.
echo.
echo 		[Atenção!]	Este script precisa ser executado como Administrador
echo.
echo 	Clique no arquivo com o botão direito do mouse e selecione a opção [Executar como administrador]
	set errcod=N0_4DM & set res=3 & goto fim
	)
	pushd "%~dp0"
	


:banner
cls
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL     LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL                         LLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL                         LLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL       LLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LL         LLL       LLLLLLLLLL       LLLLLLL       LLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LL         LLLL       LLLLLLLL       LLLLLLLL       LLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LLLLLLLLLLLLLLLL       LLLLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LL       LLLLLLLL       LLLL       LLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LL       LLLLLLLLL       LL       LLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLL    LLLLLL       LL       LLLLLLLLLL              LLLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL       LLLLLLLLLLLLLL       LLLLLLLLLLLLLLLLLLLL            LLLLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL                  LLL       LL         LLLLLLLLLL          LLLLLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLL                  LLL       LL         LLLLLLLLLLL        LLLLLLLL       LLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL    LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL    LLLL    LLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL    LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL    LLLL    LLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
echo LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
	timeout /t 2 >nul


:contato
cls
echo.
echo.
echo 	Pack de correções Windows FG204, 2nd Edition Ver 2.31 [16.07.2023]
echo 	Este script aplica correções para a maioria dos problemas conhecidos nas versões do Windows 7; 8; 8.1; 10 e 11
echo 	NÃO. Isso não vai danificar nada, todas as correções tem opção de desfazer. #CONFIA
	%linha%
echo 	Desenvolvido por @LEVIsolution
echo 	Feito de técnico para técnico e para uso técnico. 
echo 	Suporte: Levisolutionoficial@gmail.com
	%linha%
	if %res%==2 exit
	timeout /t 10



:menu0
	set menu=menu0
cls
	color 3
echo.
echo 	Menu Inicial
	%linha%

echo  	Escolha a correção que deseja aplicar
%linha%
set 	"opc0=0.	SAIR
set 	"opc1=1.	Alterar o ícone de uma partição"
set 	"opc2=2.	Ativar/Desativar [GPEdit.msc - Editor de Diretiva de Grupo]"
set 	"opc3=3.	Ativar/Desativar [LSA - Autoridade de Segurança Local]"
set 	"opc4=4.	Ativar/Desativar a Tela de Bloqueio ou a Tela de Logon"
set 	"opc5=5.	Ativar/Desativar o [Num Lock] ligado ao inicializar"
set 	"opc6=6.	Ativar/Desativar o Menu de Contexto resumido no botão direito do mouse"
set 	"opc7=7.	Ativar/Desativar a opção [Tomar Propriedade] no menu do mouse"
set 	"opc8=8.	Ativar/Desativar os resultados da web ao pesquisar no Menu Iniciar"
set 	"opc9=9.	Corrigir o erro [COM surrogate]"
set 	"opc10=10.	Desinstalar TODOS os Windows Apps pré-instalados"
set 	"opc11=11.	Exibir/Ocultar pasta específica"
set 	"opc12=12.	Instalar Codecs para reproduzir vídeos com problema"
set 	"opc13=13.	Instalar MS-Store, Calculadora, Fotos e Bloco de notas os únicos apps necessários"
set 	"opc14=14.	Limpar a fila de impressão"
set 	"opc15=15.	Personalizar a lista [Enviar para ^>] no menu do mouse"
set 	"opc16=16.	Remover vírus do navegador de internet"
set 	"opc17=17.	Restaurar a configuração padrão do MS-Office"
set 	"opc18=18.	Restaurar ícones dos arquivos e atalhos em branco ou abrindo no programa errado"


echo 	%opc0%
echo.
echo 	%opc1%
echo 	%opc2%
echo 	%opc3%
echo 	%opc4%
echo 	%opc5%
echo 	%opc6%
echo 	%opc7%
echo 	%opc8%
echo 	%opc9%
echo 	%opc10%
echo 	%opc11%
echo 	%opc12%
echo 	%opc13%
echo 	%opc14%
echo 	%opc15%
echo 	%opc16%
echo 	%opc17%
echo 	%opc18%

%linha%
echo.
set /p opc=^>	Digite uma opção e pressione [Enter]:

if %opc%==0 set res=2 & goto contato
if %opc%==%opc% goto cor%opc%
if %opc%>=19 set res=4 & goto fim





:cor1
cls
echo.
echo 	* %opc1%
%linha%
echo.
echo 	Altera o ícone de uma partição de acordo com os ícones que estejam na mesma pasta que este script.
echo.
echo 	Deseja alterar agora?
	choice /c 10 /n /m ">	[1]Alterar   [0]sair : "
	if %errorlevel%==2 set res=2 & goto fim
echo.
echo 	Dica: Para usar um ícone personalizado renomeie ele como icone99.ico e coloque na mesma pasta deste script
echo 	Em seguida na opção número do ícone, digite o número 99
echo.
	set /p letra=^>	Digite a letra da partição e pressione [Enter]: 
	set /p numero=^>	Digite o numero do ícone e pressione [Enter]: 

	pushd %~dp0
	xcopy /i /y /h "icone%numero%.ico" "%letra%:/icone.ico"
	if not %errorlevel%==0 set coderr=cor%opc%p1_p2_%errorlevel% & set res=3 & goto fim
	xcopy /i /y /h "autorun.inf" "%letra%:/autorun.inf"
set res=1 & goto fim



:cor2
cls
echo.
echo 	* %opc2%
%linha%
echo.
echo 	Ativa/Desativa o comando "GPEdit.msc" no [Executar] :
echo 	Corrige o erro: "O Windows não pode encontrar 'GPEdit.msc'. Certifique-se de que o nome foi digitado corretamente e tente novamente."
echo.
echo 	Deseja Ativar/Desativar o [GPEdit - Editor de Política de Grupo] agora?
	choice /c 12 /n /m ">	[1]Habilitar   [2]Desabilitar : "
	if %errorlevel%==2 goto cor2p2

:cor2p1
%linha%
echo.

	setlocal
	set "regChave1=HKLM\Software\Policies\Microsoft\Windows\System"

:cor2p1p1
echo  ...	Aplicando alterações na chave {%regChave1% "EnableLGP"}
	reg add "%regChave1%" /v "EnableLGP" /t REG_DWORD /d 1 /f
	for %f in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") do (dism /online /norestart /add-package:"%f")
	for %f in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") do (dism /online /norestart /add-package:"%f")
	endlocal
echo.
echo 	GPEdit - Editor de Política de Grupo ATIVADO
set res=1 & goto fim

:cor2p2
%linha%
echo.
	setlocal
	set "camBackup1=Backups\Regedit"
	set "regChave1=HKLM\Software\Policies\Microsoft\Windows\System"

:cor2p2p1
echo  ...	Criando o diretório de backup
	mkdir "%camBackup1%"

:cor2p2p2
echo.
echo  ...	Exportando a chave de registro para backup
	reg export "%regChave1%" "%camBackup1%\GPEdit_backup.reg" /y
	set exp1=%errorlevel%

:cor2p2p3
echo.
echo  ...	Copiando a chave de registro para backup
	reg copy "%regChave1%" "%regChave1%.old" /s
	set cop1=%errorlevel%
	set /a soma1=%exp1% + %cop1%
	if %soma% gtr 1 set coderr=cor2p2_p2%exp1%_p3%cop1% & set res=3 & goto fim

:cor2p2p4
echo.
echo  ...	Excluindo a chave {%regChave1% "EnableLGP"}
	reg delete %regChave1% /v "EnableLGP" /f
	endlocal
echo.
echo 	GPEdit - Editor de Política de Grupo DESATIVADO
set res=1 & goto fim



:cor3
cls
echo.
echo 	* %opc3%
%linha%
echo.
echo 	Corrige o bug de [LSA - Autoridade de Segurança Local] no aplicativo [Segurança do Windows] que exibe o aviso persistentes:
echo 	"A proteção da autoridade de segurança local está desativada. Seu dispositivo pode estar vulnerável."
echo.
echo 	Deseja ativar [LSA - Autoridade de Segurança Local] agora?
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor3p1
%linha%
echo.
	setlocal
	set "regChave1=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"
echo  ...	Aplicando alterações na chave {%regChave1% "RunAsPPL"} [Script_1]
	reg add "%regChave1%" /v "RunAsPPL" /t REG_DWORD /d 2 /f
echo.
echo  ...	Aplicando alterações na chave {%regChave1% "RunAsPPLBoot"} [Script_1]
	reg add "%regChave1%" /v "RunAsPPLBoot" /t REG_DWORD /d 2 /f
	endlocal
%linha%
echo.
echo 	Abra o aplicativo [Segurança do Windows] se a mensagem sobre proteção da [Autoridade de Segurança Local] persistir tente o Script_2.
echo.
echo 	Deseja tentar o Script_2 agora?
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=1 & goto fim

:cor3p2
%linha%
echo.
	setlocal
	set "regChave1=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"
echo  ...	Removendo alterações do Script_1
	reg delete %regChave1% /v "RunAsPPLBoot" /f
echo.
echo  ...	Aplicando alterações na chave {%regChave1% "RunAsPPL"} [Script_2]
	reg add %regChave1% /v RunAsPPL /t REG_DWORD /d 0 /f
	endlocal
%linha%
echo.
echo 	Abra o aplicativo [Segurança do Windows] e verifique se a mensagem sobre proteção da [Autoridade de Segurança Local] persiste.
echo.
echo 	Deseja tentar o Script_3 agora?
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=1 & goto fim

:cor3p3
%linha%
echo.
	setlocal
	set "regChave1=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"
echo  ...	Removendo alterações do Script_2
	reg delete %regChave1% /v "RunAsPPL" /f
echo.
echo  ...	Aplicando alterações na chave {%regChave1% "disabledomaincreds"} [Script_3]
	reg add "%regChave1%" /v "disabledomaincreds" /t REG_DWORD /d 0 /f
	endlocal
%linha%
echo.
echo 	Abra o aplicativo [Segurança do Windows] e verifique se a mensagem sobre proteção da [Autoridade de Segurança Local] persiste.
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 set res=1 & goto fim

echo  ...	Removendo alterações do Script_3
	reg delete %regChave1% /v "disabledomaincreds" /f
	set errcod=:cor3_p11_p21_p31 & set res=3 & goto fim



:cor4
cls
echo.
echo 	* %opc4%
%linha%
echo.
echo 	Ativa/Desativa a TELA DE BLOQUEIO ou a TELA DE LOGON, independente uma da outra
echo.
echo 	TELA DE BLOQUEIO 
echo 	é a primeira tela exibida ao ligar o computador, mostrando a imagem de fundo, a hora e as notificações
echo.
echo 	TELA DE LOGON 
echo 	é a tela exibida após a [Tela de Bloqueio] pedindo para inserir as credenciais de login e senha

:cor4p1
%linha%
echo.
echo 	Deseja Ativar/Desativar a TELA DE BLOQUEIO agora?

	choice /c 123 /n /m ">	[1]Ativar   [2]Desativar   [3]Pular para TELA DE LOGON : "
	if %errorlevel%==2 goto cor4p2p2
	if %errorlevel%==3 goto cor4p3

:cor4p2p1
%linha%
echo.
echo ...	Excluindo a chave {HKLM\Software\policies\microsoft\windows\Personalization "NoLockscreen"}
	reg delete HKLM\Software\policies\microsoft\windows\Personalization /v NoLockscreen /f
echo.
echo 	Tela de bloqueio ATIVADA
	goto cor4p3

:cor4p2p2
echo ...	Adicionando a chave {HKLM\Software\policies\microsoft\windows\Personalization "NoLockscreen"}
	reg add HKLM\Software\policies\microsoft\windows\Personalization /v NoLockscreen /t REG_DWORD /d 1
echo.
echo 	Tela de bloqueio DESATIVADA
	goto cor4p3

:cor4p3
%linha%
echo.
echo 	Ajustar o menu [Contas de usuário] para Ativar/Desativar a TELA DE LOGON
%linha%
echo.
echo  #1.	Para ATIVAR o login com senha 
echo 	ATIVAR a opção [Os usuários devem inserir um nome de usuário e senha para usar este computador]
echo 	Clicar em [Aplicar] e inserir a senha duas vezes
echo 	Na janela [Entrar automaticamente]. Digitar a senha duas vezes e clicar em [OK].
echo.
echo 		ou
echo.
echo  #2.	Para DESATIVAR o login com senha 
echo 	DESATIVAR a opção [Os usuários devem inserir um nome de usuário e senha para usar este computador]
echo 	Clicar em [Aplicar] e inserir a senha duas vezes
echo 	Na janela [Entrar automaticamente]. Digitar a senha duas vezes e clicar em [OK].
%linha%
echo.
echo 	Abrir o menu [Contas de usuário] agora? 
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 goto set res=2 & goto fim 
	netplwiz
set res=1 & goto fim



:cor5
cls
echo.
echo 	* %opc5%
%linha%
echo.
echo 	Ativa/Desativa o NumLock ligado por padrão ao inicializar o computador
echo.
echo 	Ativar/Desativar o NumLock ligado por padrão agora?
	choice /c 12 /n /m ">	[1]Ativar   [2]Desativar : "
	if %errorlevel%==2 goto cor5p2

:cor5p1
%linha%
echo.
echo ...	Adicionando a chave {HKU\.DEFAULT\Control Panel\Keyboard "InitialKeyboardIndicators"}
	reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
echo.
echo 	NumLock ligado por padrão ATIVADO
set res=1 & goto fim

:cor5p2
%linha%
echo.
echo ...	Excluindo a chave {HKU\.DEFAULT\Control Panel\Keyboard "InitialKeyboardIndicators"}
	reg delete "HKEU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /f
echo.
echo 	NumLock ligado por padrão DESATIVADO
set res=1 & goto fim



:cor6
cls
REM 	Windows versão 11
echo.
echo 	* %opc5%
%linha%
echo.
echo 	Ativa/Desativa a nova versão resumida do menu de contexto do mouse (que o windows 11 colocou só pra atrapalhar)
echo.
echo 	Ativar/Desativar o novo menu de contexto resumido no botão direito do mouse agora?
	choice /c 12 /n /m ">	[1]Ativar   [2]Desativar : "
	if %errorlevel%==2 goto cor6p2

:cor6p1
%linha%
echo.
echo ...	Excluindo a chave {HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}}
	reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
echo.
echo 	Novo menu de contexto resumido ATIVADO
	goto restartexplorer

:cor6p2
%linha%
echo.
echo ...	Adicionando a chave {HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32}
	reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
echo.
echo 	Novo menu de contexto resumido DESATIVADO
	goto restartexplorer




:cor7
cls
echo.
echo 	* %opc7%
%linha%
echo.
echo 	Ativa/Desativa a opção [Assumir Propriedade] no menu de contexto do mouse, dando permissões para controle total da pasta 
echo 	ou arquivo selecionado.
echo.
echo 	Deseja adicionar a opção [Assumir Propriedade] no menu de contexto do mouse?
	choice /c 12 /n /m "> 	[1]Sim   [2]Não : "
	if %errorlevel%==2 goto cor7p2

:cor7p1
%linha%
echo.
	setlocal
	set "regChave1=HKCR\*\shell\runas"
	set "regChave2=HKCR\Directory\shell\runas"

:cor7p1p1
echo  ...	Adicionando a chave {%regChave1%} [1/4]
	reg add "%regChave1%" /ve /d "Assumir Propriedade" /f
echo.
echo  ...	Adicionando a chave {%regChave1%} [2/4]
	reg add "%regChave1%" /v NoWorkingDirectory /t REG_SZ /d "" /f
echo.
echo  ...	Adicionando a chave {%regChave1%} [3/4]
	reg add "%regChave1%\command" /ve /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f
echo.
echo  ...	Adicionando a chave {%regChave1%} [4/4]
	reg add "%regChave1%\command" /v IsolatedCommand /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f

:cor7p1p2
echo.
echo  ...	Adicionando a chave {%regChave2%} [1/4]
	reg add "%regChave2%" /ve /d "Assumir Propriedade" /f
echo.
echo  ...	Adicionando a chave {%regChave2%} [2/4]
	reg add "%regChave2%" /v NoWorkingDirectory /t REG_SZ /d "" /f
echo.
echo  ...	Adicionando a chave {%regChave2%} [3/4]
	reg add "%regChave2%\command" /ve /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
echo.
echo  ...	Adicionando a chave {%regChave2%} [4/4]
	reg add "%regChave2%\command" /v IsolatedCommand /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
	endlocal
set res=1 & goto fim

:cor7p2
%linha%
echo.
	setlocal
	set "camBackup1=Backups\Regedit"
	set "regChave1=HKCR\*\shell\runas"
	set "regChave2=HKCR\Directory\shell\runas"

:cor7p2p1
echo  ...	Criando o diretório de backup
	mkdir "%camBackup1%"

:cor7p2p2
echo.
echo  ...	Exportando a chave de registro para backup Parte_1
	reg export "%regChave1%" "%camBackup1%\AssumirPropriedade_1_backup.reg" /y
	set exp1=%errorlevel%
echo.
echo  ...	Exportando a chave de registro para backup Parte_2
	reg export "%regChave2%" "%camBackup1%\AssumirPropriedade_2_backup.reg" /y
	set exp2=%errorlevel%

:cor7p2p3
echo.
echo  ...	Copiando a chave de registro para backup Parte_1
	reg copy "%regChave1%" "%regChave1%.old" /s
	set cop1=%errorlevel%
	set /a soma1=%exp1% + %cop1%
echo.
echo  ...	Copiando a chave de registro para backup Parte_2
	reg copy "%regChave2%" "%regChave2%.old" /s
	set cop2=%errorlevel%
	set /a soma2=%exp2% + %cop2%
	if %soma1%>=2 set errcod=cor7p2_p1%exp1%_p2%cop1% & set res=3 & goto fim
	if %soma2%>=2 set errcod=cor7p2_p1%exp2%_p2%cop2% & set res=3 & goto fim

:cor7p2p4
echo.
echo  ...	Excluindo a chave {%regChave1%}
	reg delete "%regChave1%" /f
	if not %errorlevel%==0 set errcod=cor7p2_p41 & set res=3 & goto fim
echo.
echo  ...	Excluindo a chave {%regChave2%}
	reg delete "%regChave2%" /f
	if not %errorlevel%==0 set errcod=cor7p2_p401 & set res=3 & goto fim
	endlocal
set res=1 & goto fim



:cor8
cls
REM 	Windows versão 10
echo.
echo 	* %opc8%
%linha%
echo.
echo 	Ativa/Desativa os [Resultados da Web] ao pesquisar no [Menu Iniciar] e faz com que a pesquisa local seja muito mais rápida.
echo.
echo 	(Uma função que nem faz sentido, se o usuário quiser pesquisar vai usar o navegador e não o Menu Iniciar)
echo.
echo 	Deseja Ativar/Desativar os Resultados da Web ao pesquisar no Menu Iniciar agora? 
	choice /c 12 /n /m ">	[1]Habilitar   [2]Desabilitar : "
	if %errorlevel%==2 goto cor8p2

:cor8p1
%linha%
echo.
echo ...	Excluindo a chave {HKLM\Software\policies\microsoft\windows\Personalization "BingSearchEnabled"}
	reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v BingSearchEnabled /f
echo 	Resultados da Web ATIVADO
set res=1 & goto fim

:cor8p2
%linha%
echo.
echo ...	Aplicando alterações na chave {HKCU\Software\Microsoft\Windows\CurrentVersion\Search "BingSearchEnabled"}
	reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /t reg_dword /v BingSearchEnabled /d 0 /f
echo 	Resultados da Web DESATIVADO
set res=1 & goto fim



:cor9
cls
echo.
echo 	* %opc9%
%linha%
echo.
echo 	Corrige um bug comum nos windows ao abrir pastas com muitos arquivos de mídia
echo.
echo 	Qual tipo de correção deseja aplicar agora?
	choice /c 12 /n /m "> 	[1]Script_1	[2]Script_2 : "
	if %errorlevel%==2 goto cor9p2p2
%linha%
echo.

:cor9p1
	regsvr32 vbscript.dll
	regsvr32 jscript.dll
echo.
echo 	Reiniciar o computador e verificar se o problema persiste, caso não tenha sido solucionado, tentar a opção [2]Script_2
set res=1 & goto fim

:cor9p2
echo.
echo  ...	Criando o diretório de Backup
	mkdir "Backups\System32"
echo.
echo  ...	Copiando o arquivo para Backup
	copy "C:\Windows\System32\clbcatq.dll" "Backups\System32"
echo.
echo  ...	Assumindo propriedade do arquivo
	takeown /f "C:\Windows\System32\clbcatq.dll"
echo.
echo  ...	Garantindo permissões a Todos
	icacls "C:\Windows\System32\clbcatq.dll" /grant:r "Todos:(F)"
echo.
echo  ...	Renomeando o arquivo "clbcatq.dll" para "~clbcatq.dll"
	rename "C:\Windows\System32\clbcatq.dll" "~clbcatq.dll"
echo.
echo  ... 	Restaurando Permissões
	icacls "C:\Windows\System32\clbcatq.dll" /reset
echo.
echo  ... 	Restaurando Proprietário padrão
	icacls "C:\Windows\System32\clbcatq.dll" /setowner "NT SERVICE\TrustedInstaller"
echo.
echo  ... 	Desabilitando Herança
	icacls "C:\Windows\System32\clbcatq.dll" /inheritance:d
echo.
echo  ... 	Concedendo permissões para "TrustedInstaller"
	icacls "C:\Windows\System32\clbcatq.dll" /grant "NT SERVICE\TrustedInstaller:(F)"
echo.
echo  ... 	Concedendo permissões para "Administradores"
	icacls "C:\Windows\System32\clbcatq.dll" /grant:r "Administradores":RX
echo.
echo  ... 	Removendo permissões de %username%
	icacls "C:\Windows\System32\clbcatq.dll" /remove "%username%"

:cor9p3
%linha%
echo.
	setlocal
	set "camBackup1=Backups\Regedit"
	set "regChave1=HKLM\Microsoft\COM3"
:cor9p3p1
echo  ...	Criando o diretório de backup
	mkdir "%camBackup1%"

:cor9p3p2
echo.
echo  ...	Exportando a chave de registro para backup Parte_1
	reg export "%regChave1%" "%camBackup1%\COMsurrogate_backup.reg" /y
	set exp1=%errorlevel%

:cor9p3p3
echo.
echo  ...	Copiando a chave de registro para backup Parte_1
	reg copy "%regChave1%" "%regChave1%.old" /s /f
	set cop1=%errorlevel%
	set /a soma1=%exp1% + %cop1%
	if %soma1%>=2 set errcod=cor9p3_p2%exp1%_p3%cop1% & set res=3 & goto fim

:cor9p3p4
echo.
echo  ...	Excluindo a chave {%regChave1%}
	reg delete "%regChave1%" /f
	if not %errorlevel%==0 set errcod=cor9p3_p41 & set res=3 & goto fim
	endlocal
set res=1 & goto fim



:cor10
cls
REM 	Windows versão 8-11
echo.
echo 	* %opc10%
%linha%
echo.
echo 	Executa 3 tipos de script diferente para remover todos os Windows Apps pré-instalados que pesam o sistema desnecessariamente.
echo.
echo 	Deseja tentar o Script_1 agora?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor10p1p1
cls
echo  ...	Desinstalando Windows Apps padrão [Script_1]
%linha%
echo.
	start ms-appinstaller:?source=https://aka.ms/getwinget
echo 	Após a Instalação ser concluída pressione qualquer tecla para continuar
goto pausa
	winget uninstall --id "Clipchamp.Clipchamp_yxz26nhyzhsrt" --accept-source-agreements
	winget uninstall --id "Microsoft.Edge" --accept-source-agreements
	winget uninstall --id "Microsoft Edge Update" --accept-source-agreements
	winget uninstall --id "Microsoft.EdgeWebView2Runtime" --accept-source-agreements
	winget uninstall --id "Microsoft.549981C3F5F10_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.BingNews_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.BingWeather_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.GamingApp_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.GetHelp_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.Getstarted_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.Paint_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.People_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.StorePurchaseApp_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.Todos_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsAlarms_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsCamera_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsMaps_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.WindowsTerminal" --accept-source-agreements
	winget uninstall --id "Microsoft.Xbox.TCUI_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.XboxGameOverlay_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.YourPhone_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.ZuneMusic_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "Microsoft.ZuneVideo_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "MicrosoftTeams_8wekyb3d8bbwe" --accept-source-agreements
	winget uninstall --id "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" --accept-source-agreements
	winget uninstall --id "Microsoft.OneDrive" --accept-source-agreements
	winget uninstall --id "microsoft.windowscommunicationsapps_8wekyb3d8bbwe" --accept-source-agreements
%linha%
echo.
echo 	Verifique se os programas foram desinstalados corretamente, ou tente o Script_2.
echo.
echo 	Deseja tentar o Script_2 agora?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=1 & goto fim

:cor10p1p2
cls
echo  ...	Desinstalando Windows Apps padrão [Script_2]
%linha%
echo.
	powershell -command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *windowsalarms* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *windowscamera* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *officehub* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *bingfinance* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *bingnews* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *onenote* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *people* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *windowsphone* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *bingsports* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *bingweather* | Remove-AppxPackage"
	powershell -command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
%linha%
echo.
echo 	Verifique se os programas foram desinstalados corretamente, ou tente o Script_3.
echo.
echo 	[ATENÇÃO!] Este script é diferente dos anteriores, ele força a remoção de TODOS os aplicativos nativos do Windows:
echo	
echo.
echo 	Deseja tentar o Script_3 agora?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=1 & goto fim

:cor10p1p3
cls
echo  ...	Desinstalando TODOS os Windows Apps padrão [Script_3]
%linha%
echo.
	powershell -command "Get-AppxPackage -AllUsers | Remove-AppxPackage"
	powershell -command "Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"

REM reinstala todos os apps de uma vez
REM	powershell -command Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)AppXManifest.xml”}

%linha%
echo.
echo 	A desinstalação foi concluída com êxito?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 start "https://www.winhelponline.com/blog/restore-windows-store-windows-10-uninstall-with-powershell/" & set res=3 & set errcod=cor10p1p3 & goto fim
set res=1 & goto fim



:cor11
cls
echo.
echo 	* %opc11%
%linha%
echo.
echo 	Mostra/Oculta uma determinada pasta de forma a não ser possível localizar dentro do sistema por nenhuma ferramenta convencional 
echo.
echo 	Deseja Mostrar/Ocultar uma pasta agora?
	choice /c 12 /n /m "> 	[1]Mostar   [2]Ocultar : "
	if %errorlevel%==2 goto cor11p2

:cor11p1
%linha%
echo.

	set /p dir=^>	Digite o diretório final da pasta desejada e pressione [Enter]:
echo  ...	Alterando os atributos do diretório %dir% 
	attrib -s -h %dir%
echo.
echo  ...	O seguinte diretório foi exibido: %dir%
set res=1 & goto fim

:cor11p2
%linha%
echo.
	set /p dir=^>	Digite o diretório final da pasta desejada e pressione [Enter]:
echo.
echo 	Pasta selecionada %dir%
echo.
echo 	Deseja ocultar a pasta acima?
	choice /c 12 /n /m "> 	[1]Sim   [2]Não : "
	if %errorlevel%==2 set res=2 & goto fim

echo  ...	Alterando os atributos do diretório %dir% 
	attrib +s +h %dir%
echo.
echo  ...	O seguinte diretório foi Ocultado: %dir%

set res=1 & goto fim



:cor12
cls
echo.
echo 	* %opc12%
%linha%
echo.
echo 	A maioria dos problemas na reprodução de vídeos é pela falta de um codec compatível para abrir eles
echo 	Confira esta lista dos melhores Codecs disponíveis, instale TODOS e depois reinicie o computador se necessário
echo.
echo   •	VLC Player (O programa de vídeo mais popular) 
echo 	Baixar o programa agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start https://www.videolan.org/vlc/
echo.
echo   •	K-Lite Codec Pack (Ajuda a reconhecer vários formatos de vídeo) 
echo 	Baixar o programa agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start https://www.codecguide.com/download_k-lite_codec_pack_standard.htm
echo.
echo   •	QuickTime (Abre os vídeos de aparelhos da Apple)
echo 	Baixar o programa agora? 
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==1 start https://support.apple.com/kb/dl837?locale=pt_BR
set res=1 & goto fim



:cor13
cls
REM 	Windows versão 8 até 11
echo.
echo 	* %opc13%
%linha%
echo.
echo 	Aplica um Script que cria compatibilidade com a instalação de aplicativos e depois instala os aplicativos:
echo 	Microsoft Store Apps, Calculadora, Fotos, e Bloco de notas.
echo.
echo 	Deseja prosseguir com a instalação?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor13p1
%linha%
echo.
echo  ...	Instalando Instalador de Aplicativo: Install App Contoso
	powershell -command "winget install --id 9NBLGGH4NNS1 --accept-package-agreements" 
echo.
echo  ...	Instalando Microsoft Store
	powershell -command "winget install --id 9WZDNCRFJBMP --accept-package-agreements" 
echo.
echo  ...	Instalando Calculadora
	powershell -command "winget install --id 9WZDNCRFHVN5 --accept-package-agreements" 
echo.
echo  ...	Instalando Fotos 
	powershell -command "winget install --id 9WZDNCRFJBH4 --accept-package-agreements" 
echo.
echo  ...	Instalando Bloco de Notas 
	powershell -command "winget install --id 9MSMLRH6LZF3 --accept-package-agreements" 

set res=1 & goto fim



:cor14
cls
echo.
echo 	* %opc14%
%linha%
echo.
echo 	Limpa a fila de impressão do computador para evitar problemas durante a manutenção da impressora.
echo.
echo 	Deseja limpar a fila de impressão agora?
	choice /c 12 /n /m "> 	[1]Sim   [2]Não : "
	if %errorlevel%==2 set res=2 & goto fim
echo  ...	Reiniciando o serviço de impressão 
	net stop spooler
	del /f /q "%systemroot%\System32\spool\PRINTERS\*.*"
	net start spooler
echo  ...	Alterando registros 
	reg add HKLM\System\CurrentControlSet\Control\Print /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d 00000000

set res=1 & goto fim



:cor15
cls
echo.
echo 	* %opc15%
%linha%
echo.
echo 	Ativa/Desativa a opção [+ Adicionar nesta lista] no menu de contexto do mouse na opção [Enviar para ^> ] ao clicar com o botão direito 
echo 	em um arquivo ou pasta. Em seguida ajuda a gerenciar quais atalhos devem aparecer na lista da opção [Enviar para ^> ].
echo.
echo 	Deseja Ativar/Desativar a opção [+ Adicionar nesta lista] agora?
	choice /c 12 /n /m "> 	[1]Habilitar   [2]Desabilitar : "
	if %errorlevel%==2 goto cor15p2

:cor15p1
%linha%
echo.
	setlocal
	set "SendTo=%appdata%\Microsoft\Windows\SendTo"
echo  ...	Criando atalho em: %appdata%\Microsoft\Windows\SendTo
	pushd "%SendTo%"
	mklink /d "[+ Adicionar nesta lista]"
	endlocal
	popd
echo 	Opção [+ Adicionar nesta lista] ATIVADA
	goto cor15p3

:cor15p2
%linha%
echo.
	setlocal
	set "SendTo=%appdata%\Microsoft\Windows\SendTo"
echo  ...	Criando atalho em: %appdata%\Microsoft\Windows\SendTo
	pushd "%SendTo%"
	del "[+ Adicionar nesta lista]"
	endlocal
	popd
echo 	Opção [+ Adicionar nesta lista] DESATIVADA

:cor15p3
%linha%
echo.
echo 	Para Adicionar ou Remover um item da lista, basta Criar ou Excluir um atalho na pasta "SendTo".
echo.
echo 	(Não apague os atalhos: "Adicionar nesta lista", "Área de trabalho (criar atalho)", "Destinatário de email", "Dispositivo Bluetooth"
echo 	e "Pasta compactada")
echo.
echo 	Deseja escolher quais atalhos exibir na lista [Enviar para ^> ] agora?
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=1 & goto fim
echo  ...	Abrindo o diretório %SendTo%
	start explorer "%SendTo%"

set res=1 & goto fim



:cor16
cls
echo.
echo 	* %opc16%
%linha%
echo.
echo 	Ajuda a remover extensões, plugins e programas maliciosos que causam mau funcionamento no uso dos navegadores e da internet no computador.
echo.
echo 	[Atenção!] Não é possível automatizar algumas etapas, pois elas precisam ser feitas pelo usuário.
echo 	LEIA CADA PASSO COM ATENÇÃO!
echo.
echo 	Deseja iniciar o Guia de Correção agora?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor16p1
%linha%
echo.
echo  #1.	Desinstale TODOS os programas que você não reconhecer
echo 		(Somente os que não tiver escrito: Intel, Microsoft, Realtek ou o mesmo nome da marca do computador)
echo.
echo  #1.1.	Desinstale o antivírus atual (não se preocupe, no final você pode instalar ele novamente)
echo.
echo 	Abrir o [Painel de Controle] agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 control appwiz.cpl
echo.
echo  #1.2.	Use um antivírus padrão da Microsoft até o final do processo, só ele pode incorporar as correções ao sistema:
echo.
echo   •	Microsoft Security Essentials (Para o Windows XP e 7) 
echo   •	Windows Defender (Vem padrão no Windows 8 ou superior. Se não tiver, instale a versão Offline)
echo   •	Windows Defender Offline (Para o Windows 7 ou superior)
echo.
echo 	(Veja as instruções completas de instalação no site oficial da Microsoft)
echo.
echo  #1.3.	Faça uma varredura rápida ou completa e continue as próximas etapas enquanto isso.
echo.
echo 	Abrir o site do [Microsoft Security Essentials] agora?
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start https://www.microsoft.com/pt-BR/download/details.aspx?id=5201
echo.
echo 	Abrir o site do [Windows Defender Offline] agora?
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start https://support.microsoft.com/pt-br/windows/ajuda-para-proteger-meu-computador-com-o-windows-defender-offline-9306d528-64bf-4668-5b80-ff533f183d6c 
%linha%
echo.
echo 	Deseja Continuar para o próximo passo, ou Voltar ao menu? 
	choice /c 10 /n /m ">	[1]Continuar   [0]Voltar ao menu : "
	if %errorlevel%==2 set res=2 &goto fim

:cor16p2
cls
%linha%
echo.
echo  #2.	Substituir os atalhos que iniciam o vírus junto ao navegador:
echo.
echo  #2.1.	Clicar com o botão direito do mouse no ícone de atalho do navegador na [Área de Trabalho]
echo 	Selecionar a opção [Abrir local do arquivo]
echo.
echo  #2.2.	Na pasta que abriu, clicar com o botão direito do mouse no ícone do navegador
echo 	Selecionar a opção: Enviar para^> Área de trabalho (criar atalho)
echo.
echo  #2.3.	Excluir os atalhos antigos e deixar apenas os novos criados
echo.
echo  #2.4.	Repetir o procedimento em todos os navegadores.
%linha%
echo.
echo 	Deseja Continuar ao próximo passo, ou Voltar ao menu? 
	choice /c 10 /n /m ">	[1]Continuar   [0]Voltar ao menu : "
	if %errorlevel%==2 set res=2 &goto fim

:cor16p3
cls
%linha%
echo.
echo  #3.	Abrir cada navegador e ajustar as configurações. Siga o tutorial com atenção!
echo.
echo 	Qual navegador você deseja ajustar agora? 
	choice /c 1234 /n /m ">	[1]Chrome   [2]Edge   [3]Firefox   [4]Pular : "
	if %errorlevel%==1 goto cor16p3p1
	if %errorlevel%==2 goto cor16p3p2
	if %errorlevel%==3 goto cor16p3p3
	if %errorlevel%==4 goto cor16p4

:cor16p3p1
cls
%linha%
echo.
echo  #3.1.	Navegador CHROME
echo.
echo 	Abrir o Chrome agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start chrome
echo.
echo   •	Zerar as configurações ao padrão
echo 	Abrir menu: Configurações^> Redefinir configurações^> Restaurar configurações para os padrões originais
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo chrome://settings/reset| clip
echo.
echo 		ou...
echo.
echo 	Para ajustar as configurações sem reiniciar tudo, siga os passos abaixo:
	timeout /t 3 >nul
echo.
echo   •	Redefinir a página inicial
echo 	Abrir menu: Configurações^> Aparência
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo chrome://settings/appearance| clip
echo.
echo 	Desativar: [Mostrar botão página inicial] e Ativar: [Página nova guia]
echo.
echo   •	Redefinir os mecanismos de pesquisa
echo 	No menu: Configurações^> Mecanismo de pesquisa^> Gerenciar mecanismos de pesquisa e pesquisa em sites
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo chrome://settings/searchEngines| clip
echo.
echo 	Na lista [Mecanismos de pesquisas] procurar o atalho "Google.com" clicar em [︙] e Selecionar [Tornar padrão]
echo 	Em TODOS os outros atalhos da lista, clicar em [︙] e Selecionar [Excluir]
echo.
echo   •	Redefinir a inicialização padrão
echo 	No menu: Configurações^> Inicialização
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo chrome://settings/onStartup| clip
echo.
echo 	Ativar: [Abrir nova guia]
echo.
echo 	Desativar: [Executar aplicativos em segundo plano quando o Google Chrome estiver fechado]
echo.
echo   •	Remover as extensões maliciosas
echo 	No menu: Configurações^> Extensões
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo chrome://extensions| clip
echo.
echo 	Procurar TODAS as extensões sem o nome "Google" e Selecionar [Remover] e novamente [Remover] se pedir pra confirmar.
%linha%
echo.
echo 	Qual navegador você deseja ajustar agora? 
	choice /c 1230 /n /m ">	[1]Pular   [2]Edge   [3]Firefox   [0]Voltar ao menu : "
	if %errorlevel%==1 goto cor16p4
	if %errorlevel%==2 goto cor16p3p2
	if %errorlevel%==3 goto cor16p3p3
	if %errorlevel%==4 set res=2 &goto fim

:cor16p3p2
cls
%linha%
echo.
echo  #3.2.	Navegador EDGE
echo.
echo 	Abrir o Edge agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start msedge
echo.
echo   •	Zerar as configurações ao padrão
echo 	No menu: Configurações^> Redefinir configurações^> Restaurar configurações para seus valores padrões
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo edge://settings/reset| clip
echo.
echo 		ou
echo.
echo 	Para ajustar as configurações sem reiniciar tudo, siga os passos abaixo:
	timeout /t 3 >nul
echo.
echo   •	Redefinir os mecanismos de pesquisa
echo 	No menu: Configurações^> Privacidade pesquisa e serviços^> Barra de pesquisa e endereços (no final da página)
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo edge://settings/search| clip
echo.
echo 	Em [Mecanismo de pesquisa usado na barra de endereços] definir [Google] como padrão
echo 	Em [A pesquisa em novas guias usa a caixa de pesquisa ou a barra de endereço] definir [Barra de endereços]
echo 	Selecionar [Gerenciar mecanismos de pesquisa] e na lista deixar apenas o atalho "Google.com" 
echo 	Em TODOS os outros atalhos da lista, clicar em [︙] e Selecionar [Remover]
echo.
echo   •	Redefinir a página inicial 
echo 	No menu: Configurações^> Aparência
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo edge://settings/appearance| clip
echo.
echo 	Desativar [Botão de Pagina Inicial] e Selecionar [Definir URL do botão]
echo 	Em [Quando o Edge inicia] Definir para [Abrir a página de nova guia]
echo 	Desativar [Botão de Pagina Inicial]
echo.
echo   •	Remova as extensões maliciosas 
echo 	No menu: Extensões^> Gerenciar extensões
echo 	Ou pressione CTRL+V na barra de endereço e pesquisa, em seguida pressione Enter
echo edge://extensions| clip
echo.
echo 	Em TODAS as extensões Selecionar [Remover] e novamente [Remover] se pedir pra confirmar.
echo 	Desativar [Permitir extensões de outras lojas]
%linha%
echo.
echo 	Qual navegador você deseja ajustar agora? 
	choice /c 1230 /n /m ">	[1]Chrome   [2]Pular   [3]Firefox   [0]Voltar ao menu : "
	if %errorlevel%==1 goto cor16p3p1
	if %errorlevel%==2 goto cor16p4
	if %errorlevel%==3 goto cor16p3p3
	if %errorlevel%==4 set res=2 &goto fim

:cor16p3p3
cls
%linha%
echo.
echo  #3.3.	Navegador FIREFOX
echo   •	Zere as configurações 
echo 	No menu: Ajustes^>Mais informações técnicas^> Faca uma limpeza no seu Firefox^> [Restaurar o Firefox...]
echo.
echo 	Abrir esse menu no Firefox agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start firefox about:support
echo.
echo 	  ou
echo.
echo 	Para ajustar as configurações sem reiniciar tudo, siga os passos abaixo:
	timeout /t 3 >nul
echo.
echo   •	Redefinir a página inicial e novas abas 
echo 	No menu: Configurações^> Início
echo 	Em [Página inicial e novas janelas] Definir para [Tela inicial do Firefox (Padrão)]
echo 	Em [Novas abas] Definir para [Tela inicial do Firefox (Padrão)]
echo.
echo 	Abrir esse menu no Firefox agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start firefox about:preferences#home
echo.
echo   •	Redefina os mecanismos de pesquisa 
echo 	No menu: Configurações^> Pesquisa
echo 	Em [Mecanismo de pesquisa padrão] definir [Google] como padrão
echo 	Na lista [Atalhos de pesquisa] selecionar TODOS e [Remover] deixando apenas o Atalho "@Google"
echo.
echo 	Abrir esse menu no Firefox agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start firefox about:preferences#search
echo.
echo   •	Remover as extensões maliciosas 
echo 	No menu: Extensões e temas^> Extensões
echo 	Na lista [Gerenciamento de extensões] remover TODAS as extensões.
echo.
echo 	Abrir esse menu no Firefox agora? 
	choice /c 12 /n /m ">	[1]Sim   [2]Não : "
	if %errorlevel%==1 start firefox about:addons
%linha%
echo.
echo.
echo 	Qual navegador você deseja ajustar agora? 
	choice /c 1230 /n /m ">	[1]Chrome	[2]Edge	[3]Pular	[0]Voltar ao menu : "
	if %errorlevel%==1 goto cor16p3p1
	if %errorlevel%==2 goto cor16p3p2
	if %errorlevel%==3 goto cor16p4
	if %errorlevel%==4 set res=2 &goto fim

:cor16p4 
cls 
%linha%
echo.
echo  #4.	Instalar um bom antivírus, a maioria é pago, mas existem alguns gratuitos: 
echo 	Recomendados: Kaspersky(Pago), Malwarebytes(Pago), Microsoft(Padrão), Avast(Gratuito) e Panda Dome(Gratuito) 

set res=1 & goto fim



:cor17
cls
REM 	Windows versão TODOS
echo.
echo 	* %opc17%
%linha%
echo.
echo 	Restaura as configurações do Microsoft Office para o padrão de fábrica, para corrigir bugs e erros.
echo.
echo 	Deseja restaurar todas as configurações do Microsoft Office para o padrão de fábrica agora?
	choice /c 10 /n /m ">	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor17p1
%linha%
echo.
	setlocal
	set "camBackup1=Backups\Regedit"
	set "regChave1=HKCU\Software\Microsoft\Office"
echo  ...	Criando o diretório de backup
	mkdir "%camBackup1%"

:cor17p1p1
echo.
echo  ...	Aplicando alterações na chave {%regChave1%}
	timeout /t 2 >nul

:cor17p1p2
echo.
echo  ...	Exportando a chave de registro para backup
	reg export "%regChave1%" "%camBackup1%\Office_backup.reg" /y
	if not %errorlevel%==0 (set exp1=1) else (set exp1="")

:cor17p1p3
echo.
echo  ...	Copiando a chave de registro para backup
	reg copy "%regChave1%" "%regChave1%.old" /s
	if not %errorlevel%==0 (set cop1=1) else (cop1="")
	if %exp1% + %cop1% > 1 set coderr=cor17_p1_%exp1%p2_%cop1% & set res=3 & goto fim

:cor17p1p4
echo.
echo  ...	Excluindo a chave original
	reg delete "%regChave1%" /f
	endlocal
echo.
echo  ...	Configuração do Microsoft Office REDEFINIDA

set res=1 & goto fim



:cor18
cls
echo.
echo 	* %opc18%
%linha%
echo.
echo 	Corrige o problema causado por associar algum FORMATO DE ARQUIVO com um PROGRAMA incompatível para abrir ele como PADRÃO.
echo.
echo 	Deseja redefinir a associação de Programa Padrão agora?
	choice /c 10 /n /m "> 	[1]Sim   [0]Não : "
	if %errorlevel%==2 set res=2 & goto fim

:cor18p1
%linha%
echo.
	setlocal
	set "camBackup1=Backups\Regedit"
	set "regChave1=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
echo  ...	Criando o diretório de backup
	mkdir "%camBackup1%"

:cor18p1p1
echo.
echo  ...	Aplicando alterações na chave {%regChave1%}
	timeout /t 2 >nul

:cor18p1p2
echo.
echo  ...	Exportando a chave de registro para backup
	reg export "%regChave1%" "%camBackup1%\FileExts_backup.reg" /y
	if not %errorlevel%==0 (set exp1=1) else (set exp1="")

:cor18p1p3
echo.
echo  ...	Copiando a chave de registro para backup
	reg copy "%regChave1%" "%regChave1%.old" /s
	if not %errorlevel%==0 (set cop1=1) else (cop1="")
	set /a soma1=%exp1% + %cop1%
	if %soma1% gtr 1 set coderr=cor18_p1_%exp1% %cop1% & set res=3 & goto fim

:cor18p1p4
echo.
echo  ...	Excluindo a chave original
	reg delete "%regChave1%" /f
	if not %errorlevel%==0 set coderr=cor18_p1 & set res=3 & goto fim
echo 	Associação de arquivos REDEFINIDA
	endlocal

set res=1 & goto fim

















REM =====================================================================================
REM 					LISTA DE COMANDOS E VARIÁVEIS
REM =====================================================================================

:pausa
set pause=Pressione qualquer tecla para continuar. . .

:restartexplorer 
%linha%
echo.
echo 	O Windows Explorer está sendo reiniciado e a barra de tarefas vai sumir por 10 segundos 
echo 	Dica: Se demorar mais, clique em qualquer lugar com o botão direito do mouse (botão de menu) 
	taskkill /f /im explorer.exe 
	start explorer.exe
	set res=1 & goto fim


:fim
%linha%
echo.
	set apl=;^)    Aplicado com sucesso!
	set can=:X     Operação cancelada pelo usuário
	set err=:^(    Erro! Falha na execução do script  
	set inv=:^/    Opção Inválida! Escolha outra opção do Menu

	if %res%==1 set msgresultado=%apl% &&color a & pause
	if %res%==2 set msgresultado=%can% &&color e 
	if %res%==3 set msgresultado=%err% &&color c & echo 	[ Código de erro: %errcod% ] & %linha% & pause
	if %res%==4 set msgresultado=%inv% &&color e


echo.
echo.
echo 		%msgresultado% 
%linha%
echo.
echo 	Voltando ao Menu Inicial
	timeout /t 3 >nul
	goto %menu% 