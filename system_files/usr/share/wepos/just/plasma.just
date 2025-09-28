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
