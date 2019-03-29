@ECHO OFF
:: .SYNOPSIS
:: Reset Policy that prevent OS shutdown
:: .EXAMPLE
:: RESETOSSHUTDOWNPOLICY.cmd .

ECHO "Resetting Shutdown Policy"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /t REG_DWORD /d 0 /f
REG query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose
GPUPDATE /FORCE
