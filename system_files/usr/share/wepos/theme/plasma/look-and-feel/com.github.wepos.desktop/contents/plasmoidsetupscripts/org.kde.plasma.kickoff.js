// Set config group
applet.currentConfigGroup = ["General"]

// General: Sort applications alphabetically
applet.writeConfig("alphaSort", "true")

// Icon
applet.writeConfig("icon", "distributor-logo-steamdeck")

// Show buttons for: Session
applet.writeConfig("primaryActions", "1")
applet.writeConfig("systemFavorites", "lock-screen\\,logout\\,save-session\\,switch-user")

// Reload config
applet.reloadConfig()
