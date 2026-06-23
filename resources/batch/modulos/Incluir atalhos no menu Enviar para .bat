	set "linha=echo ____________________________________________________________________________________________________"

	@echo off
	chcp 65001 >nul


	pushd %~dp0

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 (
	start "" ..\misc\administrador.bat "..\modulos\Incluir atalhos no menu Enviar para .bat" && goto fim
	)

:inicio
	cls
	echo.
echo 	# Pra que serve?

	echo.
echo 	Inclui a opção [+ Adicionar nesta lista] dentro da opção [Enviar para ^> ] ao 
echo 	clicar com o botão direito sobre um arquivo ou pasta.

	echo.
echo 	Ajuda a editar os atalhos da opção [Enviar para ^> ]

	%linha%
	echo.
echo 	Incluir a opção [+ Adicionar nesta lista] ?
	choice /c 1230 /n /m "| 	[1]Sim   [2]Não   [3]Editar Atalhos   [0]SAIR : "
	if "%errorlevel%"=="2" (goto excluir_adicionar_nesta_lista)
	if "%errorlevel%"=="3" (goto editar_atalhos)
	if "%errorlevel%"=="4" (goto cancelado)

:incluir_adicionar_nesta_lista

	setlocal
	set "enviar_para=%appdata%\Microsoft\Windows\SendTo"

	cls
	echo.
echo  ... Criando atalho em: %enviar_para%
	pushd "%enviar_para%"
	mklink /d "[+ Adicionar nesta lista]"
	endlocal
echo 	Opção [+ Adicionar nesta lista] ATIVADA
	goto editar_atalhos

:excluir_adicionar_nesta_lista

	setlocal
	set "enviar_para=%appdata%\Microsoft\Windows\SendTo"

	cls
	echo.
echo  ... Criando atalho em: %enviar_para%
	pushd "%enviar_para%"
	del "[+ Adicionar nesta lista]"
	endlocal
	popd
echo 	Opção [+ Adicionar nesta lista] DESATIVADA

:editar_atalhos
	cls
	echo.
echo 	Exclua os atalhos que você deseja remover da lista "Enviar para ^> "
	echo.
echo 	Dica: Não apague os atalhos "Adicionar nesta lista", "Área de trabalho (criar atalho)", 
echo 	"Destinatário de email", "Dispositivo Bluetooth" e "Pasta compactada")

	%linha%
	echo.
	choice /c 10 /n /m "|	[1]Editar atalhos   [0]Voltar : "
	if "%errorlevel%"=="2" (goto inicio)

	cls
	echo.
	setlocal
	set "enviar_para=%appdata%\Microsoft\Windows\SendTo"
echo  ... Abrindo o diretório %enviar_para%
	start explorer "%enviar_para%"
	endlocal

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



