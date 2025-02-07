#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf swap ffmpeg-free ffmpeg --allowerasing
dnf install distrobox docker emacs ffmpeg fish gstreamer1-plugin-openh264 gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly \
                          libva-nvidia-driver mesa-libGL-devel neovim rpmfusion-free-release rpmfusion-nonfree-release smplayer x265 \
                           xorg-x11-drv-nvidia zsh neovim


# this installs a package from fedora repos
dnf install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
