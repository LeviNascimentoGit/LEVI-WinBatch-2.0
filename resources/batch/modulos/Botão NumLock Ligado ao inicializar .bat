	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Botão NumLock Ligado ao inicializar .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Inicializa o computador com o botão NumLock Ligado

	%linha%
	echo.
echo 	Botão NumLock ao inicializar
	choice /c 120 /n /m "|	[1]Ligado   [2]Desligado   [0]SAIR : "
	if "%errorlevel%"=="2" (goto numlock_off)
	if "%errorlevel%"=="3" (goto cancelado)

:numlock_on
	cls
	echo.

echo  ... Editando a chave {HKU\.DEFAULT\Control Panel\Keyboard}
echo  ... Adicionando o valor DWORD: InitialKeyboardIndicators (2)
	reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f

	echo.
echo 	Botão NumLock: LIGADO
	goto sucesso

:numlock_off
	cls
	echo.

echo  ... Editando a chave {HKU\.DEFAULT\Control Panel\Keyboard}
echo  ... Excluindo o valor DWORD: InitialKeyboardIndicators
	reg delete "HKEU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /f

	echo.
echo 	Botão NumLock: DESLIGADO
	goto sucesso

:sucesso
	pushd %~dp0
	timeout 2 >nul 
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

