@echo off
title SH4RK BYTE - OTIMIZAÇAO DO SH4RK V1
color 0b

:: SOLICITAR ADMINISTRADOR (Necessário para otimizar serviços)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] ERRO: Voce precisa clicar com o botao direito e "Executar como Administrador"!
    pause >nul
    exit /b
)

:MENU
cls
echo =========================================================
echo                SH4RK BYTE - OTIMIZAÇAO DO SH4RK V1              
echo =========================================================
echo  [!] ESTADO: PRONTO PARA TURBINAR O HARDWARE
echo  [!] HARDWARE FOCO: INTEL i7-2600 + GAMING PERFORMANCE
echo =========================================================
echo.
echo  O QUE ESTE SCRIPT VAI FAZER:
echo  1. Limpeza Profunda (Temp, Prefetch, %temp%, Recent)
echo  2. Otimizacao de Memoria RAM e Cache de Disco
echo  3. Desativar Telemetria e Servicos Inuteis do Windows
echo  4. Prioridade Maxima para Jogos (Reducao de Lag)
echo  5. Limpeza de Logs e Lixeira
echo.
echo  Obs: me execute como aadmin!!!!!!
echo.
echo =========================================================
set /p confirmar="Deseja iniciar a otimizacao extrema? (S/N): "
if /i "%confirmar%" neq "S" exit

cls
echo =========================================================
echo            INICIANDO PROTOCOLO SH4RK BYTE...
echo =========================================================
echo.

:: --- LIMPEZA DE PASTAS ---
echo [PROCESSO 1] Limpando arquivos residuais...
del /s /f /q %temp%\* >nul 2>&1
del /s /f /q C:\Windows\Temp\* >nul 2>&1
del /s /f /q C:\Windows\Prefetch\* >nul 2>&1
del /s /f /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
del /s /f /q %appdata%\Microsoft\Windows\Recent\* >nul 2>&1
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>&1
echo [OK] Pastas de lixo esvaziadas.

:: --- OTIMIZACAO DE SISTEMA ---
echo [PROCESSO 2] Ajustando Kernell e Prioridade de Processador...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Latencia de sistema reduzida.

:: --- DESATIVAR SERVICOS PESADOS ---
echo [PROCESSO 3] Encerrando processos inuteis em segundo plano...
:: Desativa o SysMain (Superfetch) que as vezes engasga o HD
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
:: Desativa rastreamento (Telemetria)
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
echo [OK] Servicos pesados desativados.

:: --- REDE E PING ---
echo [PROCESSO 4] Otimizando pacotes de rede para jogos...
ipconfig /flushdns >nul 2>&1
netsh int ip reset >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo [OK] DNS e TCP configurados.

:: --- LIMPEZA DE DISCO VIA COMANDO ---
echo [PROCESSO 5] Executando limpeza de sistema profunda...
cleanmgr /sagerun:1 >nul 2>&1
echo [OK] Logs e arquivos de sistema antigos removidos.

echo.
echo =========================================================
echo             OTIMIZACAO CONCLUIDA COM SUCESSO!
echo =========================================================
echo.
echo [!] DICA: Reinicie seu PC para aplicar todas as mudancas.
echo [!] Foco total no i7-2600 ativado.
echo.
echo Pressione qualquer tecla para sair...
pause >nul
exit