	@echo off
	chcp 65001 >nul
	mode con: cols=56 lines=7

:inicio

	cls
	color 6
	
	echo.
echo 	_______________________________________
	echo.
echo 	:^/    Opção Inválida! Tente novamente.
echo 	_______________________________________
	echo.
	timeout /t 1 >nul
	color 8
	timeout /t 1 >nul
	color 6
	timeout /t 1 >nul
	color 7
	mode con: cols=100 lines=40

