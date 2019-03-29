@ECHO OFF
:: .SYNOPSIS
:: Outlook Fix for isread:false filter
:: .EXAMPLE
:: OUTLOOKSEARCHFIXUNREAD.cmd .

ECHO "Resetting Shutdown Policy"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Search" /v DisableServerAssistedSearch /t REG_DWORD /d 1 /f
REG query "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Search" /v DisableServerAssistedSearch
