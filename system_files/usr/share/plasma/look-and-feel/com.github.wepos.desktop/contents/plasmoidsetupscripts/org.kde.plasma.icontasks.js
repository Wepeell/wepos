// Set config group
applet.currentConfigGroup = ["General"]

// Clicking grouped task: Shows small window previews
applet.writeConfig("groupedTaskVisualization", "1")

// General: Mute task when clicking indicator: OFF
applet.writeConfig("interactiveMute", "false")

// Set default pinned apps
applet.writeConfig("launchers", [
    "applications:org.gnome.Ptyxis.desktop",
    "applications:org.kde.dolphin.desktop",
    "applications:org.keepassxc.KeePassXC.desktop",
    "applications:org.fooyin.fooyin.desktop",
    "applications:steam.desktop",
    "applications:com.discordapp.Discord.desktop",
    "preferred://browser"
]);

// General: Show media and volume controls in tooltip: OFF
applet.writeConfig("tooltipControls", "false")

// Reload config
applet.reloadConfig()
