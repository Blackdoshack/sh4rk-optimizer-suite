@echo off
title SH4rk BYTE - Limpeza de Sistema
echo Limpando arquivos temporarios...
del /s /f /q %temp%\*
del /s /f /q C:\Windows\Temp\*
del /s /f /q C:\Windows\Prefetch\*
ipconfig /flushdns
echo.
echo Limpeza concluida com sucesso!
pause