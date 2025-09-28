# Restart KDE Plasma
[group('KDE Plasma')]
restart-plasma:
	#!/usr/bin/env bash
	set -euo pipefail

	# Restart systemd Plasma service
	systemctl --user restart plasma-plasmashell

# Configure delay on hover preview and tooltip
[group('KDE Plasma')]
set-delay-plasma:
	#!/usr/bin/env bash
	set -euo pipefail

	# Set delay
	kwriteconfig6 --file "plasmarc" --group "PlasmaToolTips" --key "Delay" "200"

# Configure keyboard settings
[group('KDE Plasma')]
setup-keyboard:
	#!/usr/bin/env bash
	set -euo pipefail

	## Model
	# This is not needed for pc104
	# kwriteconfig6 --file "kxkbrc" --group "Layout" --key "Model" "pc104"

	## NumLock on startup
	# 0 = Turn on
	# 1 = Turn off
	kwriteconfig6 --file "kcminputrc" --group "Keyboard" --key "NumLock" "0"

	## Layouts
	# Turn on keyboard layouts
	kwriteconfig6 --file "kxkbrc" --group "Layout" --key "Use" "true"
	# Add keyboard layouts
	# US and SE language
	kwriteconfig6 --file "kxkbrc" --group "Layout" --key "LayoutList" "us,se"
	# Add keyboard variants
	# US-SE and SE-US variants
	kwriteconfig6 --file "kxkbrc" --group "Layout" --key "VariantList" "us-se,se-us"
	# Not sure what this does but it is added with the other settings
	kwriteconfig6 --file "kxkbrc" --group "Layout" --key "DisplayNames" ","

	## Shortcuts
	# Change layout
	# Default shortcut is "Meta+Alt+K"
	# Set to Alt+Shift
	kwriteconfig6 --file "kglobalshortcutsrc" --group "KDE Keyboard Layout Switcher" --key "Switch to Next Keyboard Layout" "Alt+Shift,Meta+Alt+K,Switch to Next Keyboard Layout"
	# Switch to last used layout
	# Default shortcut is "Meta+Alt+L"
	# Set to none
	kwriteconfig6 --file "kglobalshortcutsrc" --group "KDE Keyboard Layout Switcher" --key "Switch to Last-Used Keyboard Layout" ",Meta+Alt+L,Switch to Last-Used Keyboard Layout"

	echo "Log out and in to apply these keyboard changes"
