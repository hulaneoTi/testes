@ECHO OFF
for /F "tokens=*" %%A in (%localappdata%\Microsoft\WindowsApps\list.txt) do (
    if /I NOT %%A==start.bat (
        ::verificar se o bat está em execução, se estiver ele deve ser finalizado.
        powershell "start %%A -WindowStyle Hidden"
    )
)