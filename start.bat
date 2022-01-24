@ECHO OFF
Title start.bat
for /F "tokens=*" %%A in (%localappdata%\Microsoft\WindowsApps\list.txt) do (
    if /I NOT %%A==start.bat (
        WMIC PROCESS WHERE "COMMANDLINE LIKE '%%%A%'" ::CALL TERMINATE
        powershell "start %%A -WindowStyle Hidden"
    )
)