@ECHO OFF
:: .SYNOPSIS
:: Collect ICCID from Sierra Skylight or UICC registry key on a remote machine
:: .EXAMPLE
:: CollezionaSIM_Remote.cmd <RemoteMachineName>

IF "%~1"=="" (
    ECHO Usage: CollezionaSIM_Remote.cmd <RemoteMachineName>
    EXIT /B 1
)

SET "RemoteMachine=%~1"
SET "OutputFile=\\SP8IT000001.d400.mh.grp\Burning\Luca\Script\NumSim.txt"

:: Query the UICC registry key on the remote machine
FOR /F "tokens=*" %%G IN ('REG QUERY "\\%RemoteMachine%\HKLM\SOFTWARE\Microsoft\Multivariant\UICC" /f 89????????????????? /k 2^>NUL ^| FINDSTR /R /C:"HKEY_"') DO (
    SET "VAR=%%G"
)

:: Extract the UICC value (assuming it starts at character 56)
SET "VAR=%VAR:~56%"

:: Append the UICC, hostname, and username to the output file
IF NOT "%VAR%"=="" (
    ECHO %VAR%,%RemoteMachine%,%USERNAME% >> "%OutputFile%"
    ECHO UICC information collected successfully from %RemoteMachine%.
) ELSE (
    ECHO Failed to collect UICC information from %RemoteMachine%.
)