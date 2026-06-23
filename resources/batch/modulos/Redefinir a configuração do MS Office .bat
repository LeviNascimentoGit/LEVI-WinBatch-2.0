	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Redefinir a configuração do MS Office .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Redefine as configurações do Microsoft Office para o padrão de fábrica, para 
echo 	corrigir bugs e erros.

	%linha%
	echo.
	choice /c 10 /n /m "|	[1]Redefinir   [0]SAIR : "
	if "%errorlevel%"=="2" (goto cancelado)

:redefinir_office
	setlocal
	set "pasta_backup_regedit=Backups\Regedit"
	set "regkey_office=HKCU\Software\Microsoft\Office"

	pushd ..\..\..

	cls
	echo.
echo  ... Criando o diretório de backup
	mkdir "%pasta_backup_regedit%"

	echo.
echo  ... Exportando a chave de registro para:
echo 	%pasta_backup_regedit%
	reg export "%regkey_office%" "%camBackup1%\Office_backup.reg" /y

	echo.
echo  ... Criando uma cópia da chave de registro
	reg copy "%regChave1%" "%regChave1%.old" /s

	cls
	echo.
echo  ... Excluindo a chave {%regkey_office%}
	reg delete "%regkey_office%" /f
	if not "%errorlevel%"=="0" (goto erro)
	endlocal

	echo.
echo  ... Configuração do MS Office REDEFINIDA
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
