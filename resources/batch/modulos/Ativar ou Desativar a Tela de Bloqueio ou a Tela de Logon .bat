	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Ativar ou Desativar a Tela de Bloqueio ou a Tela de Logon .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?
	echo.
echo 	Ativa/Desativa as telas de BLOQUEIO ou LOGON

	%linha%
	echo.
echo 	1. TELA DE BLOQUEIO:
echo 	É a primeira tela exibida ao ligar o computador, mostrando a imagem de fundo, a 
echo 	hora e as notificações.

	echo.
echo 	2. TELA DE LOGON: 
echo 	É a tela exibida após a Tela de Bloqueio, pedindo para inserir as credenciais de
echo 	login e senha

	%linha%
	echo.
echo 	Selecione uma opção:
	choice /c 120 /n /m "|	[1]Tela de Bloqueio   [2]Tela de Logon   [0]SAIR : "
	if "%errorlevel%"=="2" (goto tela_de_logon)
	if "%errorlevel%"=="3" (goto cancelado)

:tela_de_bloqueio
	cls
	echo.
echo 	Ativar/Desativar a TELA DE BLOQUEIO
	choice /c 120 /n /m "|	[1]Ativar   [2]Desativar   [0]Voltar : "
	if "%errorlevel%"=="2" (goto desativar_tela_de_bloqueio)
	if "%errorlevel%"=="3" (goto inicio)

:ativar_tela_de_bloqueio
	cls
	echo.
	set "regkey_personalization=HKLM\Software\policies\microsoft\windows\Personalization"
echo  ... Editando a chave {%regkey_personalization%}
echo  ... Excluindo o valor DWORD: NoLockscreen
	reg delete %regkey_personalization% /v NoLockscreen /f
	if not "%errorlevel%"=="0" (goto erro)
	
	echo.
echo 	Tela de bloqueio ATIVADA
	goto sucesso

:desativar_tela_de_bloqueio
	cls
	echo.
echo  ... Adicionando a chave {HKLM\Software\policies\microsoft\windows\Personalization "NoLockscreen"}
	reg add HKLM\Software\policies\microsoft\windows\Personalization /v NoLockscreen /t REG_DWORD /d 1
echo.
echo 	Tela de bloqueio DESATIVADA
	goto sucesso

:tela_de_logon
	cls
	echo.
echo 	Para Ativar/Desativar a TELA DE LOGON, Abra o menu [Contas de usuário]

	%linha%
	echo.
echo 	# Para ATIVAR o login com senha
	echo.
echo  	1. ATIVAR a opção "Os usuários devem inserir um nome de usuário e senha para usar 
echo 	este computador"
echo 	2. Clicar em [Aplicar] e inserir a senha duas vezes
echo 	3. Na janela "Entrar automaticamente". Digitar a senha duas vezes e clicar em [OK].

	echo.
echo 	# Para DESATIVAR o login com senha 
	echo.
echo 	1. DESATIVAR a opção "Os usuários devem inserir um nome de usuário e senha para usar
echo 	este computador"
echo 	2. Clicar em [Aplicar] e inserir a senha duas vezes
echo 	3. Na janela "Entrar automaticamente". Digitar a senha duas vezes e clicar em [OK].

	%linha%
	echo.
	choice /c 10 /n /m "|	[1]Continuar   [0]Voltar : "
	if "%errorlevel%"=="2" (goto inicio)

	netplwiz
	goto sucesso

:sucesso
	timeout 2 >nul 
	pushd %~dp0
	call "..\resultados\sucesso.bat" & goto inicio

:erro
	timeout 5 >nul 
	pushd %~dp0
	call "..\resultados\erro.bat"
	goto fim

:cancelado
	pushd %~dp0
	call "..\resultados\cancelado.bat"
:fim
	endlocal
