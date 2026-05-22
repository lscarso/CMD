@echo off
:: The batch file I wanted to write required a number of optional parameters in
:: any sequence, the only way I could figure out which ones were which was to
:: include a label before the parameter.  The following batch file shows how
:: this is implemented:
:: Simon Richardson
:: simonr@uklinux.net
:: name: ARGUMENTS.BAT
:: parameters:
:: -c <c name>	The cname parm
:: -s <s name>	The sname parm
:: -u <u name>	The uname parm
:: note a maximum of 3 parameters

:initial
if "%1"=="-c" goto lcname
if "%1"=="-s" goto lsname
if "%1"=="-u" goto luname
if "%1"=="" goto print
goto error

:lcname
shift
set cname=%1
goto lreturn

:lsname
shift
set sname=%1
goto lreturn

:luname
shift
set uname=%1

:lreturn
shift
call arguments.bat %1 %2 %3 %4 %5 %6
goto done

:error
echo %0 usage error
goto done

:print
echo cname = %cname%
echo sname = %sname%
echo uname = %uname%

:done
