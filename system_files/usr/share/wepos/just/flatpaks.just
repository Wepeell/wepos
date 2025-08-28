# Install Flatpaks
[group('Install')]
install-flatpaks:
	#!/usr/bin/env bash
	set -euo pipefail

	echo "Installing Flatpaks..."

	flatpak install --system -y flathub \
		com.borgbase.Vorta \
		com.discordapp.Discord \
		com.github.qarmin.czkawka \
		com.usebottles.bottles \
		io.github.mpc_qt.mpc-qt \
		io.github.radiolamp.mangojuice \
		org.keepassxc.KeePassXC \
		org.photoqt.PhotoQt \
		org.qbittorrent.qBittorrent \
		org.telegram.desktop \
		org.virt_manager.virt-manager \
		org.virt_manager.virt_manager.Extension.Qemu \

	echo "Flatpaks installed."

