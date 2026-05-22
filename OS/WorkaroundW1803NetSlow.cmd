@ECHO OFF
:: .SYNOPSIS
:: Set lanman cache to 0
:: .PARAMETER: ComputerName
:: Hostname or IP address of remote computer
:: .EXAMPLE
:: WORKAROUDW1803NETSLOW.cmd Computer01
:: .EXAMPLE
:: WORKAROUDW1803NETSLOW.cmd .

SETLOCAL
IF [%1]==[] (
ECHO WARNING: Missing COMPUTER name
SET /p PC="Computer Name: "
ECHO.
) ELSE (
SET PC=%1
)

ECHO "Disable Lanman Cache: %PC%"
REG ADD "\\%PC%\HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v DirectoryCacheLifetime /t REG_DWORD /d 0 /f
REG ADD "\\%PC%\HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v FileInfoCacheLifetime /t REG_DWORD /d 0 /f
REG ADD "\\%PC%\HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v FileNotFoundCacheLifetime /t REG_DWORD /d 0 /f
REG query "\\%PC%\HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /s

ENDLOCAL

pause
