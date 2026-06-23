	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Estilo do Menu de Contexto do mouse no windows 11 .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Atera o novo estilo resumido do Menu de Contexto do mouse no Windows 11 e 
echo 	devolve o estilo completo, com a aparência clássica igual ao Windows 10.

	%linha%
	echo.
echo 	Estilo do Menu de Contexto
	choice /c 120 /n /m "|	[1]Resumido   [2]Completo   [0]SAIR : "
	if "%errorlevel%"=="2" (menu_de_contexto_completo)
	if "%errorlevel%"=="3" (goto cancelado)


:menu_de_contexto_resumido
	cls
	echo.
echo  ... Excluindo a chave {HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}}
	reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
	if not "%errorlevel%"=="0" (if not "%errorlevel%"=="1" (goto erro))

	echo.
echo 	Novo Menu de Contexto ATIVADO
	goto restart_explorer

:menu_de_contexto_completo
	cls
	echo.
echo  ... Adicionando a chave {HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32}
	reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
	if not "%errorlevel%"=="0" (goto erro)
	echo.
echo 	Novo Menu de Contexto DESATIVADO
	goto restart_explorer

:restart_explorer
	%linha%
	echo.
echo 	O Windows Explorer está sendo reiniciado. A barra de tarefas vai sumir.

	timeout /t 2 >nul
	taskkill /f /im explorer.exe 
	start explorer.exe
	timeout /t 10 >nul

	cls
	echo.
echo 	Clique em qualquer lugar com o botão direito do mouse.
	timeout /t 4 >nul 
	goto sucesso

:sucesso
	pushd %~dp0
	timeout /t 2 >nul 
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

