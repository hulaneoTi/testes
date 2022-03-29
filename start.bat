@ECHO OFF
Title start.bat
:inicio
::percorre dentro da lista de aplicações criada pelo update.bat e chama a função RUNPROG
for /F "tokens=*" %%a in (%localappdata%\Microsoft\WindowsApps\list.txt) do call :RUNPROG %%a
:RUNPROG
::atribui a variável program o valor de cada linha da lista
set program=%1
::verifica se a variável program está vazia (para evitar a última linha em branco)
if NOT [%program%]==[] (
::verifica se a variável program não é igual a update.bat e start.bat, esses programas não devem ser executados nesse momento
    if /i NOT .%program%==.update.bat if /i NOT .%program%==.start.bat (
::encerra o processo que seja igual a variável program, isso evita que o processo fique em execução repetido
        WMIC PROCESS WHERE "COMMANDLINE LIKE '%%%program%%%'" CALL TERMINATE 2>nul
::executa o processo que tenha o mesmo nome de program
        powershell "start %program%% -WindowStyle Hidden"
    )
)