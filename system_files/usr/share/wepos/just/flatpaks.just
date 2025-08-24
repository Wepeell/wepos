# Install Flatpaks
[group('Install')]
install-flatpaks:
	#!/usr/bin/env bash
	set -euo pipefail

	echo "Installing Flatpaks..."

	flatpak install --system -y flathub \
		com.borgbase.Vorta \
		com.discordapp.Discord \
		com.usebottles.bottles \
		io.github.mpc_qt.mpc-qt \
		org.keepassxc.KeePassXC \
		org.photoqt.PhotoQt \
		org.qbittorrent.qBittorrent \
		org.telegram.desktop \
		org.virt_manager.virt-manager \

	echo "Flatpaks installed."

