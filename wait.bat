@ECHO OFF
::espera 30 minutos e inicia o update.bat
timeout 1800
START /WAIT powershell "start update.bat -WindowStyle Hidden"