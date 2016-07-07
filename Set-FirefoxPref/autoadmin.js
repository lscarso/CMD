// set Firefox Default homepage
var env_user = getenv("USERNAME").substring(0, 2);
var env_mozdebug= getenv("MOZILLA_DEBUG");

if (env_user == "it8" || env_user == "exit8"){
    lockPref("browser.startup.homepage","http://intranet.kion.grp/omstill");
} else {
    lockPref("browser.startup.homepage","http://intranet.kion.grp");
}

if (env_mozdebug) {
    displayError("debug ffox cfg v100",
                 "\n\nuser=" + env_user
                );
}


// disable default browser check
lockPref("browser.shell.checkDefaultBrowser", false);
lockPref("browser.startup.homepage_override.mstone", "ignore");

// disable application updates
lockPref("app.update.enabled", false);