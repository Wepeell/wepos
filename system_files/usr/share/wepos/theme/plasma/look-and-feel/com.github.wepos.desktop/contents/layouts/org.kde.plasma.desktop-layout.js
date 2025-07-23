// Load default panel template
loadTemplate("org.kde.plasma.desktop.defaultPanel");

// Disable floating on the panel
var allPanels = panels();
allPanels.forEach(panel => {
	panel.floating = false;
});

// Set default pinned apps
// This only applies to the panel/widget that is created when the global theme is first applied
// Use "plasmoidsetupscripts/org.kde.plasma.icontasks.js" instead as that will apply on any icontasks widget
// allPanels.forEach(panel => {
	// var allWidgets = panel.widgets();
	// allWidgets.forEach(widget => {
		// if (widget.type === "org.kde.plasma.icontasks") {
			// widget.currentConfigGroup = ["General"];
			// widget.writeConfig("launchers", [
				// "applications:org.gnome.Ptyxis.desktop",
				// "applications:org.kde.dolphin.desktop",
				// "preferred://browser"
			// ]);
		// }
	// });
// });

// Load dynamic wallpaper plugin
var allDesktops = desktopsForActivity(currentActivity());
allDesktops.forEach(desktop => {
	desktop.wallpaperPlugin = 'com.github.zzag.dynamic';
});
