@ECHO OFF
::espera 30 minutos e inicia o update.bat
timeout 1800 > nul
START powershell "start update.bat -WindowStyle Hidden"	