@ECHO OFF
:: .SYNOPSIS
:: Remove all saved password from Credential Manager
:: .EXAMPLE
:: ClearSavedPassword.cmd

::English
setlocal
for /F "tokens=1,2 delims= " %%G in ('cmdkey /list ^| findstr Target') do (@echo Deleting: %%H & cmdkey /delete %%H)
endlocal
::Italian
setlocal
for /F "tokens=1,2 delims= " %%G in ('cmdkey /list ^| findstr Destinazione') do (@echo Deleting: %%H & cmdkey /delete %%H)
endlocal

pause
