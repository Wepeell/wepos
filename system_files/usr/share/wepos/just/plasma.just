# Restart KDE Plasma
[group('KDE Plasma')]
restart-plasma:
	#!/usr/bin/env bash
	set -euo pipefail

	# Restart systemd Plasma service
	systemctl --user restart plasma-plasmashell
