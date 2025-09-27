// Load WepOS default panel
loadTemplate("com.github.wepos.desktop.defaultPanel");

// Load dynamic wallpaper plugin
var allDesktops = desktopsForActivity(currentActivity());
allDesktops.forEach(desktop => {
	desktop.wallpaperPlugin = 'com.github.zzag.dynamic';
});
