ECHO OFF
:: NAME: SET-REMOTEAPPS.CMD v1.0
:: DATE: 31/08/2016
:: PURPOSE:  Deploy RemoteApps on Windows 7 - Starting from 8, it's possible to use GPO
:: Set defaultFeed as needed 

rundll32.exe tsworkspace,WorkspaceSilentSetup \\SP8IT000001.d400.mh.grp\Burning\STILL-RemoteApps.wcx