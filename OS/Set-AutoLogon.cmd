@ ECHO OFF

SETLOCAL
IF [%1]==[] (
ECHO WARNING: Missing USER name
SET /p USER="User Name: "
ECHO.
) ELSE (
SET USER=%1
)

IF [%2]==[] (
ECHO WARNING: Missing USER domain
SET /p DOM="User Domain: "
ECHO.
) ELSE (
SET DOM=%2
)


IF [%3]==[] (
ECHO WARNING: Missing USER password
SET /p PWD="User Password: "
ECHO.
) ELSE (
SET PWD=%3
)

ECHO "Adding AutoAdminLogon"
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoAdminLogon /t REG_SZ /d 1
ECHO "- Adding DefaultUserName: %USER%"
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultUserName /t REG_SZ /d %USER%
ECHO "- Adding DefaultDomainName: %DOM%"
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultDomainName /t REG_SZ /d %DOM%
ECHO "- Adding DefaultPassword: %PWD%"
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultPassword /t REG_SZ /d %PWD%
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoLogonCount /t REG_DWORD /d 0
