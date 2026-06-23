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
echo 	Ativa/Desativa os 'Resultados da Web' ao pesquisar no 'Menu Iniciar' e faz com que a pesquisa local seja muito mais rápida.
	
	%linha%
	echo.
echo 	Resultados da Web
	choice /c 120 /n /m "| 	[1]Ativar   [2]Desativar   [0]SAIR : "
	if "%errorlevel%"=="2" (goto desativar_resutados_da_web)
	if "%errorlevel%"=="3" (goto cancelado)

:ativar_resutados_da_web
	cls
	%linha%
	echo.
echo  ... Editando a chave {HKLM\Software\policies\microsoft\windows\Personalization}
echo  ... Excluindo o valor DWORD: BingSearchEnabled
	reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v BingSearchEnabled /f
echo 	Resultados da Web ATIVADO
	goto sucesso

:desativar_resutados_da_web
%linha%
echo.
echo  ... Editando a chave {HKCU\Software\Microsoft\Windows\CurrentVersion\Search}
echo  ... Adicionando o valor DWORD: BingSearchEnabled (0)
	reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /t reg_dword /v BingSearchEnabled /d 0 /f

	echo.
echo 	Resultados da Web DESATIVADO
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

