// Set config group
applet.currentConfigGroup = ["Appearance"]

// Date format: ISO date
applet.writeConfig("dateFormat", "isoDate")

// Display time zone as: Offset from UTC time
applet.writeConfig("displayTimezoneFormat", "UTCOffset")

// First day of week: Monday
applet.writeConfig("firstDayOfWeek", "1")

// Show week numbers: ON
applet.writeConfig("showWeekNumbers", "true")

// Time display: 24-Hour
applet.writeConfig("use24hFormat", "2")

// Reload config
applet.reloadConfig()
