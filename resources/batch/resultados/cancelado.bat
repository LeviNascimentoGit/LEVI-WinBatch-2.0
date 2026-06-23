:fim
	@echo off
	chcp 65001 >nul
	mode con: cols=55 lines=7
	
:inicio
	
	cls
	color 7
	echo.
echo 	_______________________________________
	echo.
echo 	:X     Operação cancelada pelo usuário.
echo 	_______________________________________
	echo.
	
	timeout /t 1 >nul
	color 8
	timeout /t 1 >nul
	color 7
	timeout /t 1 >nul
	mode con: cols=100 lines=40

