# WepOS - Wepeell OS

This is a personal custom image of [Bazzite](https://github.com/ublue-os/bazzite) (`bazzite:stable`).

## Things added

- [plasma5-wallpapers-dynamic](https://github.com/zzag/plasma5-wallpapers-dynamic)
- [CoolerControl](https://gitlab.com/coolercontrol/coolercontrol)
- [Linux FCP Support Tools](https://github.com/geoffreybennett/fcp-support)
- [Scarlett4 Firmware](https://github.com/geoffreybennett/scarlett4-firmware)
- [ALSA Scarlett Control Panel](https://github.com/geoffreybennett/alsa-scarlett-gui)

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
