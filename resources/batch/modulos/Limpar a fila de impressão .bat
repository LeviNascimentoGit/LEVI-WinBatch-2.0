	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Limpar a fila de impressão .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Limpa a fila de impressão do computador para evitar problemas durante a manutenção 
echo 	da impressora.

	%linha%
	echo.
	choice /c 10 /n /m "| 	[1]Limpar   [0]SAIR : "
	if "%errorlevel%"=="2" (goto cancelado)

	cls
	echo.
echo  ... Reiniciando o Serviço de Impressão 
	net stop spooler
	del /f /q "%systemroot%\System32\spool\PRINTERS\*.*"
	net start spooler

	echo.
echo  ... Editando a chave {HKLM\System\CurrentControlSet\Control\Print}
echo  ... Adicionando o valor DWORD: RpcAuthnLevelPrivacyEnabled (00000000)
	echo sim|reg add HKLM\System\CurrentControlSet\Control\Print /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d 00000000

	if not "%errorlevel%"=="0" (goto erro)

:sucesso
	pushd %~dp0
	timeout /t 3 >nul 
	call "..\resultados\sucesso.bat" & goto fim

:erro
	pushd %~dp0
	timeout /t 5 >nul 
	call "..\resultados\erro.bat"
	goto fim

:cancelado
	pushd %~dp0
	call "..\resultados\cancelado.bat"
:fim
	endlocal


