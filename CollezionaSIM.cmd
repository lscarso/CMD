@ECHO OFF
:: .SYNOPSIS
:: Collect iccid from Sierra skylight and hostname, username
:: .EXAMPLE
:: CollectICCID.cmd

# Skylight
#for /F "tokens=*" %%G in ('reg QUERY "HKCU\Software\Sierra Wireless Inc\Skylight\DataUsage" /f 89????????????????? /k 2^>NUL ^| FINDSTR /R /C:"HKEY_"') do (set VAR=%%G)
#SET "VAR=%VAR:~66%"

for /F "tokens=*" %%G in ('reg query "hklm\SOFTWARE\Microsoft\Multivariant\UICC" /f 89????????????????? /k 2^>NUL ^| FINDSTR /R /C:"HKEY_"') do (set VAR=%%G)
SET "VAR=%VAR:~56%"

echo %VAR%,%COMPUTERNAME%,%USERNAME% >> \\SP8IT000001.d400.mh.grp\Burning\Luca\Script\NumSim.txt
