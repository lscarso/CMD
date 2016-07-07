REM Create Mozilla.cfg
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" ECHO // Set Global autoconfig> "%ProgramFiles(x86)%\Mozilla Firefox\mozilla.cfg"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" ECHO lockPref("autoadmin.global_config_url","http://ITLTEAPP01.d400.mh.grp/autoadmin.js");> "%ProgramFiles(x86)%\Mozilla Firefox\mozilla.cfg"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" ECHO lockPref("autoadmin.append_emailaddr",false);>> "%ProgramFiles(x86)%\Mozilla Firefox\mozilla.cfg"

REM Create it8-kion_autoconfig.js
if not exist "%ProgramFiles(x86)%\Mozilla Firefox\Browser\defaults\preferences" MKDIR "%ProgramFiles(x86)%\Mozilla Firefox\Browser\defaults\preferences" 
if exist "%ProgramFiles(x86)%\Mozilla Firefox\defaults\preferences" ECHO // Set cfg file> "%ProgramFiles(x86)%\Mozilla Firefox\Browser\defaults\preferences\it8-kion_autoconfig.js"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\defaults\preferences" ECHO pref("general.config.obscure_value", 0);>> "%ProgramFiles(x86)%\Mozilla Firefox\Browser\defaults\preferences\it8-kion_autoconfig.js"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\defaults\preferences" ECHO pref('general.config.filename', 'mozilla.cfg');>> "%ProgramFiles(x86)%\Mozilla Firefox\Browser\defaults\preferences\it8-kion_autoconfig.js"