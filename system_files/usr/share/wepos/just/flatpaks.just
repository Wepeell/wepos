# Install Flatpaks
[group('Install')]
install-flatpaks:
	#!/usr/bin/env bash
	set -euo pipefail
	
	echo "Installing Flatpaks..."
	
	flatpak install --system -y flathub \
		com.usebottles.bottles \
		io.github.mpc_qt.mpc-qt \
		com.borgbase.Vorta
	
	echo "Flatpaks installed."
