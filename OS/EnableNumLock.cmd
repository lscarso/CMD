@ECHO OFF
:: .SYNOPSIS
:: Set Num Lock ON at startup (Login Screen)
:: .PARAMETER: ComputerName
:: Hostname or IP address of remote computer
:: .EXAMPLE
:: ENABLENUMLOCK.cmd Computer01
:: .EXAMPLE
:: ENABLENUMLOCK.cmd .

SETLOCAL
IF [%1]==[] (
ECHO WARNING: Missing COMPUTER name
SET /p PC="Computer Name: "
ECHO.
) ELSE (
SET PC=%1
)

ECHO "Resetting Offline File on: %PC%"
REG ADD "\\%PC%\HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2147483650 /f
REG query "\\%PC%\HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators

ENDLOCAL
