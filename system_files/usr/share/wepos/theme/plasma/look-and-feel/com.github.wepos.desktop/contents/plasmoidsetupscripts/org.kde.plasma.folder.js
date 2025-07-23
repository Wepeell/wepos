// This one doesn't work, use "layouts/org.kde.plasma.desktop-layout.js" instead
// applet.wallpaperPlugin = 'com.github.zzag.dynamic'

// Set default wallpaper
applet.currentConfigGroup = ["Wallpaper", "com.github.zzag.dynamic", "General"]
applet.writeConfig("Image", "file:///usr/share/wallpapers/Dynamic/contents/images/Lakeside.avif")
applet.reloadConfig()
