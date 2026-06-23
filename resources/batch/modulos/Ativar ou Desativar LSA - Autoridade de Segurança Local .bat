	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Ativar ou Desativar LSA - Autoridade de Segurança Local .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Corrige o bug de 'LSA - Autoridade de Segurança Local' no aplicativo  
echo  	'Segurança do Windows', e remove o aviso persistente: "A proteção da autoridade de
echo 	segurança local está desativada. Seu dispositivo pode estar vulnerável."

	%linha%

	echo.
echo 	LSA - Autoridade de Segurança Local
	choice /c 120 /n /m "|	[1]Ativar (Script_1)   [2]Desativar   [0]SAIR : "
	if "%errorlevel%"=="2" (goto desativar_lsa)
	if "%errorlevel%"=="3" (goto cancelado)

:ativar_script_1
	cls
	setlocal
	set "regkey_lsa=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"

	echo.
echo 	Iniciando o Script_1

	echo.
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Criando o valor DWORD: RunAsPPL (2)
	reg add "%regkey_lsa%" /v "RunAsPPL" /t REG_DWORD /d 2 /f
	if not "%errorlevel%"=="0" (goto erro)

	echo.
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Criando o valor DWORD: RunAsPPLBoot (2)
	reg add "%regkey_lsa%" /v "RunAsPPLBoot" /t REG_DWORD /d 2 /f
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	%linha%
	echo.
echo 	Abra o aplicativo 'Segurança do Windows'.
echo 	O aviso sobre proteção da 'Autoridade de Segurança Local' ainda está sendo mostrado?

	echo.
	choice /c 10 /n /m "|	[1]Sim   [0]Não : "
	if "%errorlevel%"=="2" (goto sucesso)

:ativar_script_2
	cls
	echo.
	setlocal
	set "regkey_lsa=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"
echo  ... Removendo alterações do Script_1
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Excluindo o valor DWORD: RunAsPPLBoot
	reg delete %regkey_lsa% /v "RunAsPPLBoot" /f

	echo.
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Criando o valor DWORD: RunAsPPL (0)
	reg add %regkey_lsa% /v RunAsPPL /t REG_DWORD /d 0 /f
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	%linha%
	echo.
echo 	Abra o aplicativo 'Segurança do Windows'.
echo 	O aviso sobre proteção da 'Autoridade de Segurança Local' ainda está sendo mostrado?

	echo.
	choice /c 10 /n /m "|	[1]Sim   [0]Não : "
	if "%errorlevel%"=="2" (goto sucesso)

:ativar_script_3
	cls
	echo.
	setlocal
	set "regkey_lsa=HKLM\SYSTEM\CurrentControlSet\Control\Lsa"
echo  ... Removendo alterações do Script_2
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Excluindo o valor DWORD: RunAsPPL
	reg delete %regkey_lsa% /v "RunAsPPL" /f

	echo.
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Criando o valor DWORD: disabledomaincreds (0)
	reg add "%regkey_lsa%" /v "disabledomaincreds" /t REG_DWORD /d 0 /f
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	%linha%
	echo.
echo 	Abra o aplicativo 'Segurança do Windows'.
echo 	O aviso sobre proteção da 'Autoridade de Segurança Local' ainda está sendo mostrado?

	echo.
	choice /c 10 /n /m "|	[1]Sim   [0]Não : "
	if "%errorlevel%"=="2" (goto sucesso)

:desativar_lsa
	cls
	echo.
echo  ... Removendo alterações do Script_3
echo  ... Editando a chave {%regkey_lsa%}
echo  ... Excluindo o valor DWORD: disabledomaincreds
	reg delete %regkey_lsa% /v "disabledomaincreds" /f
	goto erro

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
