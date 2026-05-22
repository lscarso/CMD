@ECHO OFF
:: NAME: DEPLOYREMOTEAPPS.CMD v1.0
:: DATE: 31/08/2016
:: PURPOSE:  Deploy RemoteApps on Windows 7 - Starting from 8, it's possible to use GPO
:: Set defaultFeed as needed 

pushd %TMP%

echo ^<?xml version="1.0" encoding="utf-8" standalone="yes"?^> > remoteapps.wcx
echo ^<workspace name="Work Resources" xmlns="http://schemas.microsoft.com/ts/2008/09/tswcx" xmlns:xs="http://www.w3.org/2001/XMLSchema"^> >> remoteapps.wcx
echo   ^<defaultFeed url="https://MYSERVER.local/RDWeb/Feed/webfeed.aspx" /^> >> remoteapps.wcx
echo ^</workspace^> >> remoteapps.wcx

rundll32.exe tsworkspace,WorkspaceSilentSetup remoteapps.wcx

del remoteapps.wcx

popd
