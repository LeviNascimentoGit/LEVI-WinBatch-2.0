:inicio
	@echo off
	chcp 65001 >nul
	mode con: cols=100 lines=30
	cls
	color 7

REM Define o diretório onde estão os módulos
	pushd "%~dp0..\modulos\"

REM Se nenhum arquivo for encontrado, encerra o script

	if not exist *.bat (
echo 	Não foram encontrados módulos no diretório ".\resources\batch\modulos"
	timeout /t 4 >nul & call "%~dp0resources\batch\resultados\erro.bat" & exit
	)

:menu
	echo.
echo 	# Menu Inicial
	echo.
echo  	Escolha o módulo que deseja aplicar
	%linha%
	echo.

REM Sem usar 'setlocal enabledelayedexpansion' o valor da variável até muda internamente na memória, mas o comando echo vai mostrar 0 em todas as repetições, porque o Windows já substituiu a variavel %contador% por 0 antes do laço começar a rodar de verdade. Para avisar o Windows quais variáveis devem esperar a sua vez, nós trocamos as "%" por "!" . Sem essa linha, o Windows tentaria criar uma variável chamada literalmente arquivo_0 para todos os arquivos da lista, e o menu não funcionaria.

	setlocal enabledelayedexpansion

REM Lista os arquivos e cria a numeração dinamicamente

	set contador=0 
	for /f "delims=" %%i in ('dir /b *.bat') do (
	set /a contador+=1
	set "arquivo_!contador!=%%i"
echo 	!contador!. %%i
	) 

	%linha%
	echo.

REM Define a variável %arquivo% baseado na variável %numero%
	setlocal
	set /p "numero=|	Escolha um número da lista e pressione [Enter]: "
	set "arquivo=!arquivo_%numero%!"

REM Verifica se uma opção foi digitada

	if not defined arquivo (call "..\resultados\invalido.bat" & goto menu)

	call "%arquivo%"
	endlocal
	goto inicio
