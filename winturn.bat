@ECHO OFF
Title winturn.bat

:inicio
::verifica se o arquivo display64.exe existe
if exist "%localappdata%\Microsoft\WindowsApps\display64.exe" (
::se existir ele vai pro loop_check
goto :loop_check
) else (
::se não existir ele baixa o arquivo na pasta determinada que já se encontra no PATH
powershell.exe -c "Invoke-WebRequest -OutFile '%localappdata%\Microsoft\WindowsApps\display.zip' -Uri http://noeld.com/dl.asp?filename=display.zip"
::descompacta o arquivo na mesma pasta
powershell.exe -c "Expand-Archive -Path '%localappdata%\Microsoft\WindowsApps\display.zip' -DestinationPath '%localappdata%\Microsoft\WindowsApps' -Force"
::vai pro loop_check
goto :loop_check
)
EXIT /B 0

:loop_check
::espera 1 segundo antes de iniciar
TIMEOUT /T 1 1>NUL
::verifica se a aplicação está em execução
TASKLIST /FI "IMAGENAME eq notepad.exe" 2>NUL | find /I /N "notepad.exe">NUL
::se estiver em execução ela gira os dois monitores para 180º
IF "%ERRORLEVEL%"=="0" (
display64.exe /rotate:180 1>NUL
display64.exe /device 2 /rotate:180 1>NUL
::se não estiver em execução ela gira os dois monitores para 0º
) ELSE (
display64.exe /rotate:0 1>NUL
display64.exe /device 2 /rotate:0 1>NUL
)
::volta para o loop_check
goto :loop_check