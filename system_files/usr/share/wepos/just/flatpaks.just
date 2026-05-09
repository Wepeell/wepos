# Install Flatpaks
[group('Flatpaks')]
install-flatpaks:
    #!/usr/bin/env bash
    set -euo pipefail

    # Flatpaks array
    flatpaks=(
    	com.borgbase.Vorta
    	com.discordapp.Discord
    	com.github.qarmin.czkawka
    	com.usebottles.bottles
    	fr.handbrake.ghb
    	io.github.mpc_qt.mpc-qt
    	io.github.radiolamp.mangojuice
    	io.github.shonebinu.Brief
    	it.mijorus.gearlever
    	org.fedoraproject.MediaWriter
    	org.fooyin.fooyin
    	org.gimp.GIMP
    	org.gimp.GIMP.Plugin.GMic
    	org.kde.kclock
    	org.kde.kdenlive
    	org.kde.kruler
    	org.keepassxc.KeePassXC
    	org.libreoffice.LibreOffice
    	org.localsend.localsend_app
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
