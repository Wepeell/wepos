# WepOS - Wepeell OS

This is a personal custom image of [Bazzite](https://github.com/ublue-os/bazzite) (`bazzite:stable`).

## Things added

- [Borg Backup](https://github.com/borgbackup/borg)
- [plasma5-wallpapers-dynamic](https://github.com/zzag/plasma5-wallpapers-dynamic)
- [Podman Compose](https://github.com/containers/podman-compose)
- [CoolerControl](https://gitlab.com/coolercontrol/coolercontrol)
- [Starship](https://github.com/starship/starship)
- [Faugus Launcher](https://github.com/Faugus/faugus-launcher)
- [Linux FCP Support Tools](https://github.com/geoffreybennett/fcp-support)
- [Scarlett4 Firmware](https://github.com/geoffreybennett/scarlett4-firmware)
- [ALSA Scarlett Control Panel](https://github.com/geoffreybennett/alsa-scarlett-gui)
- [USB firmware for Fractal Audio Axe-Fx 2](https://github.com/M0JXD/axefx2-usb-installer)
- [Mullvad VPN](https://github.com/mullvad/mullvadvpn-app)

## Custom wjust commands

Most of the personal customizations are done in the userspace with just recipes. 

Run `wjust` to list them all.

## Install

Download and install Bazzite first.

Then run:

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/wepeell/wepos:latest
```

## Uninstall

To switch back to Bazzite:

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/ublue-os/bazzite:stable
```
