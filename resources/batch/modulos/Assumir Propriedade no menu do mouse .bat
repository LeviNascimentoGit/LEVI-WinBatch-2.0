	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Assumir Propriedade no menu do mouse .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Inclui a opção [Assumir Propriedade] no menu de contexto do mouse, dando permissões 
echo 	para controle total da pasta ou arquivo selecionado.

	%linha%
	echo.
echo 	Incluir a opção [Assumir Propriedade] ? 
	choice /c 120 /n /m "| 	[1]Sim   [2]Não   [0]SAIR : "
	if "%errorlevel%"=="2" (goto nao_assumir_propriedade)
	if "%errorlevel%"=="3" (goto cancelado)

:assumir_propriedade_script_1
	setlocal
	set "regkey_runas1=HKCR\*\shell\runas"
	set "regkey_runas2=HKCR\Directory\shell\runas"

	cls
	echo.
echo  ... Editando a chave de registro {%regkey_runas1%}
echo  ... Adicionando o valor da cadeia de caracteres: Assumir Propriedade 
	reg add "%regkey_runas1%" /ve /d "Assumir Propriedade" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor DWORD: NoWorkingDirectory ()
	reg add "%regkey_runas1%" /v NoWorkingDirectory /t REG_SZ /d "" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor da cadeia de caracteres: takeown
	reg add "%regkey_runas1%\command" /ve /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor DWORD: takeown
	reg add "%regkey_runas1%\command" /v IsolatedCommand /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f
	if not "%errorlevel%"=="0" (goto erro)


:assumir_propriedade_script_2
	cls
	echo.
echo  ... Editando a chave de registro {%regkey_runas2%}
echo  ... Adicionando o valor: Assumir Propriedade
	reg add "%regkey_runas2%" /ve /d "Assumir Propriedade" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor: NoWorkingDirectory ()
	reg add "%regkey_runas2%" /v NoWorkingDirectory /t REG_SZ /d "" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor: takeown
	reg add "%regkey_runas2%\command" /ve /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
	if not "%errorlevel%"=="0" (goto erro)


	echo.
echo  ... Adicionando o valor: takeown
	reg add "%regkey_runas2%\command" /v IsolatedCommand /t REG_SZ /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
	if not "%errorlevel%"=="0" (goto erro)

	endlocal

	goto sucesso

:nao_assumir_propriedade
	setlocal
	set "regkey_runas1=HKCR\*\shell\runas"
	set "regkey_runas2=HKCR\Directory\shell\runas"

	cls
	echo.
echo  ... Excluindo a chave {%regkey_runas1%}
	reg delete "%regkey_runas1%" /f
	if not "%errorlevel%"=="0" (goto erro)
echo.
echo  ... Excluindo a chave {%regkey_runas2%}
	reg delete "%regkey_runas2%" /f
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	goto sucesso

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


