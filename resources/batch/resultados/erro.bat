	@echo off
	chcp 65001 >nul
	mode con: cols=58 lines=7

:inicio

	cls
	color 47
	
	echo.
echo 	_________________________________________
	echo.
echo 	:^(    Erro! Falha na execução do script.
echo 	_________________________________________
	echo.

	timeout /t 1 >nul
	color 7
	timeout /t 1 >nul
	color 47
	timeout /t 1 >nul
	color 7
	mode con: cols=100 lines=40
