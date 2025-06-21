// Set default pinned apps
applet.currentConfigGroup = ["General"]
applet.writeConfig("launchers", [
    "applications:org.gnome.Ptyxis.desktop",
    "applications:org.kde.dolphin.desktop",
    "preferred://browser"
]);
applet.reloadConfig()
