# Install Flatpaks
[group('Install')]
install-flatpaks:
	#!/usr/bin/env bash
	set -euo pipefail

	# Flatpaks array
	flatpaks=(
		com.borgbase.Vorta
		com.discordapp.Discord
		com.github.qarmin.czkawka
		com.usebottles.bottles
		io.github.mpc_qt.mpc-qt
		io.github.radiolamp.mangojuice
		org.fooyin.fooyin
		org.keepassxc.KeePassXC
		org.musicbrainz.Picard
		org.photoqt.PhotoQt
		org.qbittorrent.qBittorrent
		org.telegram.desktop
		org.virt_manager.virt-manager
		org.virt_manager.virt_manager.Extension.Qemu
	)

	# Install all flatpaks from array
	echo "Installing Flatpaks..."
	echo
	flatpak install --system -y flathub "${flatpaks[@]}"
	echo
	echo "Flatpaks installed."
	echo
