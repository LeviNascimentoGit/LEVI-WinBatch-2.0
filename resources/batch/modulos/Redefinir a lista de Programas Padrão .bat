	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Redefinir a lista de Programas Padrão .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Redefine o Programa Padrão para todos os formatos de arquivo.

	%linha%
	echo.
	choice /c 10 /n /m "| 	[1]Redefinir   [0]SAIR : "
	if "%errorlevel%"=="2" (goto cancelado)

:redefinir_programa_padrao
	setlocal
	set "pasta_backup_regedit=Backups\Regedit"
	set "regkey_fileexts=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"

	pushd..\..\..

	cls
	echo.
echo  ... Criando o diretório de backup
	mkdir "%pasta_backup_regedit%"

	echo.
echo  ... Exportando a chave de registro para:
echo 	%pasta_backup_regedit%
	reg export "%regkey_fileexts%" "%pasta_backup_regedit%\FileExts_backup.reg" /y

	echo.
echo  ... Criando uma cópia da chave de registro
	reg copy "%regkey_fileexts%" "%regkey_fileexts%.old" /s

	echo.
echo  ... Excluindo a chave {%regkey_fileexts%}
	reg delete "%regkey_fileexts%" /f
	if not "%errorlevel%"=="0" (goto erro)

	echo.
echo 	Associação de arquivos REDEFINIDA
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
