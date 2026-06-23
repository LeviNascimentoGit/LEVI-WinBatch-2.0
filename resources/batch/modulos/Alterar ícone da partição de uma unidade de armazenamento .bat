	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Altera o ícone da partição de uma unidade de armazenamento, como dispositivos USB e 
echo 	Discos locais.

	%linha%

	echo.
	choice /c 10 /n /m "|	[1]Continuar   [0]SAIR : "

REM Se o número for 0, o script encerra aqui.

	if "%errorlevel%"=="2" (goto fim)	
	
:letra
	cls
	echo.
	set /p "letra=|	Digite a letra da partição na unidade de armazenamento e pressione [Enter]: "
	if not defined letra (cls & goto letra)
	if not exist "%letra%:\" (call "..\resultados\invalido.bat" & goto letra)

:icone
	echo.
echo 	Para redefinir padrão, apenas pressione [Enter], ou
echo 	para alterar, Arraste o ícone desejado para esta janela e confirme [Enter]
	set /p "icone=|	Ícone selecionado: " %1

:redefinir
REM Limpa arquivos pré-existentes pra evitar o erro 'acesso negado' ao copiar sobrescrevendo.

	del /f /a "%letra%:\autorun.inf" "%letra%:\autorun.ico"

REM Se a variável %icone% estiver vazia, o script encerra aqui.

	if not defined icone (goto sucesso)	

	cls
	echo f | xcopy /y /h %icone% "%letra%:/autorun.ico"
	if not "%errorlevel%"=="0" (
echo 	Não foi possível criar o arquivo "%letra%:/autorun.ico"
	goto erro
	)
	attrib +h "%letra%:/autorun.ico"

	echo [autorun] > "%letra%:/autorun.inf"
	echo icon = autorun.ico >> "%letra%:/autorun.inf"
	if not "%errorlevel%"=="0" (
echo 	Não foi possível criar o arquivo "%letra%:/autorun.inf"
	goto erro
	)
	attrib +h "%letra%:/autorun.inf"
	goto sucesso

:sucesso
	timeout 2 >nul 
	pushd %~dp0
	call "..\resultados\sucesso.bat" & goto fim

:erro
	timeout 5 >nul 
	pushd %~dp0
	call "..\resultados\erro.bat"
	goto fim

:cancelado
	pushd %~dp0
	call "..\resultados\cancelado.bat"
:fim
	endlocal
