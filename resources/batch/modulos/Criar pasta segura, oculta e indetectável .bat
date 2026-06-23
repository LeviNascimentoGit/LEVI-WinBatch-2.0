	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Criar pasta segura, oculta e indetectável .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Ativa uma pasta segura que não é possível localizar dentro do sistema por nenhuma 
echo 	ferramenta convencional. 

	%linha%
	echo.
echo 	Pasta segura
	choice /c 120 /n /m "| 	[1]Mostrar   [2]Ocultar   [0]SAIR : "
	if "%errorlevel%"=="2" (goto ocultar_pasta)
	if "%errorlevel%"=="3" (goto cancelado)

:mostrar_pasta
	cls
	echo.
	set /p "dir=|	Digite o diretório da pasta desejada e pressione [Enter]: "

	echo.
echo  ... Alterando os atributos do diretório %dir% 
	attrib -s -h %dir%

	echo.
echo  ... Pasta Segura Exibida: %dir%
	goto sucesso

:ocultar_pasta
	cls
	echo.
	set /p "dir=|	Digite o diretório final da pasta desejada e pressione [Enter]: "


	echo.
echo 	Dicas: 1- Não esqueça o caminho do diretório. 2- Exclua o histórico do gerenciador de arquivos.
 
	echo.
echo 	Pasta selecionada %dir%
echo 	Deseja ocultar a pasta acima?
	choice /c 12 /n /m "| 	[1]Sim   [2]Não : "
	if "%errorlevel%"=="2" (goto inicio)

	echo.
echo  ... Alterando os atributos do diretório %dir% 
	attrib +s +h %dir%
	if not "%errorlevel%"=="0" (goto erro)
	echo.
echo  ... Pasta segura OCULTA: %dir%
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


