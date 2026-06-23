	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Ativar ou Desativar GPEdit - Editor de Diretiva de Grupo .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?
	echo.
echo 	Corrige o erro: "O Windows não pode encontrar 'GPEdit.msc'. Certifique-se de que
echo 	o nome foi digitado corretamente e tente novamente."

	%linha%
	echo.
echo 	GPEdit - Editor de Política de Grupo
	choice /c 120 /n /m "|	[1]Ativar   [2]Desativar   [0]SAIR : "
	if "%errorlevel%"=="2" (goto gpedit_desativado)
	if "%errorlevel%"=="3" (goto cancelado)

:gpedit_ativado
	cls
	echo.

	setlocal
	set "regkey_system=HKLM\Software\Policies\Microsoft\Windows\System"

echo  ... Editando a chave {%regkey_system%}
echo  ... Criando o valor DWORD: EnableLGP ^(1^)

	reg add "%regkey_system%" /v "EnableLGP" /t REG_DWORD /d 1 /f
	if not "%errorlevel%"=="0" (goto erro)

	echo.
echo  ... Procurando o pacote Client Tools
echo  ... Instalando o pacote online via DISM - Deployment Image Servicing and Management

	for %%f in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") do (dism /online /norestart /add-package:"%%f")
	if not "%errorlevel%"=="0" (goto erro)

	echo.
echo  ... Procurando o pacote Client Extensions
echo  ... Instalando o pacote online via DISM - Deployment Image Servicing and Management

	for %%f in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") do (dism /online /norestart /add-package:"%%f")
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	echo.
echo 	GPEdit - Editor de Política de Grupo: ATIVADO
	goto sucesso

:gpedit_desativado
	cls
	echo.

	pushd ..\..\..

	setlocal
	set "regkey_system=HKLM\Software\Policies\Microsoft\Windows\System"

echo  ... Editando a chave {%regkey_system%}
echo  ... Excluindo o valor DWORD: EnableLGP
	reg delete %regkey_system% /v "EnableLGP" /f	
	if not "%errorlevel%"=="0" (
	if not "%errorlevel%"=="1" (goto erro)
	)
	endlocal

	echo.
echo 	GPEdit - Editor de Política de Grupo: DESATIVADO

	goto sucesso

:sucesso
	timeout 2 >nul 
	pushd %~dp0
	call "..\resultados\sucesso.bat" & goto fim

:erro
	pushd %~dp0
	timeout 5 >nul 
	call "..\resultados\erro.bat"
	goto fim

:cancelado
	pushd %~dp0
	call "..\resultados\cancelado.bat"
:fim
	endlocal
