systemtrayId = applet.readConfig("SystrayContainmentId");
if (systemtrayId) {
    const systrayContainer = desktopById(systemtrayId);
    systrayContainer.currentConfigGroup = ["General"];
    systrayContainer.writeConfig("scaleIconsToFit", true);
}

// Set config group
applet.currentConfigGroup = ["General"]

// Entries
applet.writeConfig("hiddenItems", "org.kde.plasma.brightness,org.kde.plasma.mediacontroller")

// Reload config
applet.reloadConfig()
