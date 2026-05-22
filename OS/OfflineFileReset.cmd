@ECHO OFF
:: .SYNOPSIS
:: Reset offline file cache on a remote Computer
:: .PARAMETER: ComputerName
:: Hostname or IP address of remote computer
:: .EXAMPLE
:: OFFLINEFILERESET.cmd Computer01
:: .EXAMPLE
:: OFFLINEFILERESET.cmd .

SETLOCAL
IF [%1]==[] (
ECHO WARNING: Missing COMPUTER name
SET /p PC="Computer Name: "
ECHO.
) ELSE (
SET PC=%1
)

ECHO "Resetting Offline File on: %PC%"
REG ADD "\\%PC%\HKLM\System\CurrentControlSet\Services\CSC\Parameters" /v FormatDatabase /t REG_DWORD /d 1 /f
REG query "\\%PC%\HKLM\System\CurrentControlSet\Services\CSC\Parameters" /v FormatDatabase

ENDLOCAL
