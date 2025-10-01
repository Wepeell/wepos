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
	kwriteconfig6 --file "plasmarc" --group "PlasmaToolTips" --key "Delay" "400"

# Configure Region & Language
[group('KDE Plasma')]
setup-locale:
	#!/usr/bin/env bash
	set -euo pipefail

	## Language
	# kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LANG" "en_US.utf8"
	# kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LANG" --delete

	## Numbers
	# Leave as default

	## Time
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_TIME" "en_SE.UTF-8"

	## Currency
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_MONETARY" "en_SE.UTF-8"

	## Measurements
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_MEASUREMENT" "en_SE.UTF-8"

	## Paper Size
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_PAPER" "en_SE.UTF-8"

	## Address
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_ADDRESS" "sv_SE.UTF-8"

	## Name Style
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_NAME" "sv_SE.UTF-8"

	## Phone Numbers
	kwriteconfig6 --file "plasma-localerc" --group "Formats" --key "LC_TELEPHONE" "sv_SE.UTF-8"

	## Data and Storage Sizes
	# Leave as default
