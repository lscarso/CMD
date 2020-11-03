for /F "tokens=*" %%G in ('reg QUERY "HKCU\Software\Sierra Wireless Inc\Skylight\DataUsage" /f 89????????????????? /k 2^>NUL ^| FINDSTR /R /C:"HKEY_"') do (set VAR=%%G)

SET "VAR=%VAR:~66%"

echo %VAR%,%COMPUTERNAME%,%USERNAME% >> \\SP8IT000001.d400.mh.grp\Burning\Luca\Script\NumSim.txt

#reg query "HKCU\Software\Sierra Wireless Inc\Skylight\DataUsage" /f 89?????????????????  >> \\SP8IT000001.d400.mh.grp\Burning\Luca\Script\NumSim.txt