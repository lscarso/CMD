@ECHO OFF
:: .SYNOPSIS
:: SET BIOS with DELL cctk
:: .PARAMETER: ComputerName
:: Hostname or IP address of remote computer
:: .EXAMPLE
:: BIOSSETTING.cmd Computer01
:: .EXAMPLE
:: BIOSSETTING.cmd
:: .NOTES
:: Change at line 17 the path of  psexec
:: Change at line 18 the path of exe you exported from DELL Command Config
:: PSEXEC should be on path

SETLOCAL
:: .PARAMETERS
SET PSEXECPATH="C:\Data\PSTools"
SET CCTKPATH=\\myfileserver.local\share\dell\MyBIOSSettings.exe

IF [%1]==[] (
ECHO WARNING: Missing COMPUTER name
SET /p PC="Computer Name: "
ECHO.
) ELSE (
SET PC=%1
)

ECHO "Setting BIOS on: %PC%"
PUSHD %PSEXECPATH%
PSEXEC  \\%PC% -h -i -s cmd /c %CCTKPATH%
POPD

ENDLOCAL
