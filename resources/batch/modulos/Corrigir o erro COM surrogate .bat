	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Corrigir o erro COM surrogate .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Corrige um bug comum nos windows ao abrir pastas com muitos arquivos de mídia

	%linha%
	echo.
echo 	Qual tipo de correção deseja aplicar agora?
	choice /c 1230 /n /m "| 	[1]Script_1   [2]Script_2   [3]Script_3   [0]SAIR : "
	if "%errorlevel%"=="2" (goto script_2)
	if "%errorlevel%"=="3" (goto script_3)
	if "%errorlevel%"=="4" (goto cancelado)

:script_1
	cls
	regsvr32 vbscript.dll
	regsvr32 jscript.dll

	echo.
	echo.
echo 	Reinicie o computador. Se o problema não tiver sido solucionado, tente a opção
echo 	[2]Script_2
	echo.
	pause
	goto sucesso

:script_2
	cls
	pushd %~dp0..\..\..
	set "pasta_backup_system32=Backups\System32"

	echo.
echo  ... Criando o diretório de Backup
	mkdir "%pasta_backup_system32%"

	echo.
echo  ... Copiando o arquivo para Backup
	copy "C:\Windows\System32\clbcatq.dll" "%pasta_backup_system32%"

	echo.
echo  ... Assumindo propriedade do arquivo
	takeown /f "C:\Windows\System32\clbcatq.dll"

	echo.
echo  ... Garantindo permissões a 'Todos'
	icacls "C:\Windows\System32\clbcatq.dll" /grant:r "Todos:(F)"

	echo.
echo  ... Renomeando o arquivo 'clbcatq.dll' para '~clbcatq.dll'
	rename "C:\Windows\System32\clbcatq.dll" "~clbcatq.dll"

	echo.
echo  ... Restaurando Permissões
	icacls "C:\Windows\System32\clbcatq.dll" /reset

	echo.
echo  ... Restaurando Proprietário 'TrustedInstaller'
	icacls "C:\Windows\System32\clbcatq.dll" /setowner "NT SERVICE\TrustedInstaller"

	echo.
echo  ... Desabilitando Herança
	icacls "C:\Windows\System32\clbcatq.dll" /inheritance:d

	echo.
echo  ... Concedendo permissões para 'TrustedInstaller'
	icacls "C:\Windows\System32\clbcatq.dll" /grant "NT SERVICE\TrustedInstaller:(F)"

	echo.
echo  ... Concedendo permissões para 'Administradores'
	icacls "C:\Windows\System32\clbcatq.dll" /grant:r "Administradores":RX

	echo.
echo  ... Removendo permissões de %username%
	icacls "C:\Windows\System32\clbcatq.dll" /remove "%username%"

:script_3
	cls
	setlocal
	set "regkey_com3=HKLM\Microsoft\COM3"
	set "pasta_backup_regedit=Backups\Regedit"

	echo.
echo  ... Criando o diretório de backup
	mkdir "%pasta_backup_regedit%"

	echo.
echo  ... Exportando a chave de registro para:
echo 	%pasta_backup_regedit%
	reg export "%regkey_com3%" "%pasta_backup_regedit%\COMsurrogate_backup.reg" /y

	echo.
echo  ... Cópia de backup da chave de registro
	reg copy "%regkey_com3%" "%regkey_com3%.backup" /s /f

echo.
echo  ... Excluindo a chave {%regkey_com3%}
	reg delete "%regkey_com3%" /f
	if not %errorlevel%==0 goto erro
	endlocal
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

