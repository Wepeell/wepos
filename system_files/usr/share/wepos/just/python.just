# Install Emborg (Borg Backup front-end) through uv
[group('Python')]
install-emborg:
	#!/usr/bin/env bash
	set -euo pipefail

	# Install Emborg through uv
	echo "Installing 'emborg' through uv..."
	echo
	uv tool install "emborg"
	echo
	echo "'emborg' installed."

