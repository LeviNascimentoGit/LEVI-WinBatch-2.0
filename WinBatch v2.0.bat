REM Oculta as linhas de comando
	@echo off

REM Altera a codificação do prompt para UTF-8 (corrige acentos)
	chcp 65001 >nul

REM Define o tamanho da janela
	mode con: cols=0 lines=0

REM Define o diretório padrão para onde o script está
	pushd "%~dp0"

REM Cria a variável estética %linha%

	set linha=echo ____________________________________________________________________________________________________
	
:banner
 
call "%~dp0resources\batch\misc\banner.bat"

:menu
call "%~dp0\resources\batch\misc\menu.bat" & exit