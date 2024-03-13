#!/bin/ash

# Update apk repositories
apk update
apk upgrade

# Application Packages 
apk add sudo curl nano wget tzdata musl vim ca-certificates libseccomp socat nmap net-tools nfs-utils iptables
apk add busybox-extras
# Display managers 
# apk add sudo build-base setxkbmap xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
#apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add htop atop vtop gtop bashtop glances nmon
apk add bash bash-doc bash-completion
apk add openssh
apk add dpkg rpm
apk add nfs-util
apk add make gcc python-dev automake autoconf libtool curl openssl openssl-dev libgcc alpine-sdk
apk --no-cache add ca-certificates wget

#  Download and install glibc (required for certain applications)
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
apk add glibc-2.28-r0.apk


#!/bin/ash

# Update apk repositories
apk update
apk upgrade

# Essential Tools
apk add sudo curl nano wget tzdata musl vim ca-certificates libseccomp socat nmap net-tools nfs-utils iptables busybox-extras openssh bash bash-doc bash-completion dpkg rpm make gcc python-dev automake autoconf libtool openssl openssl-dev libgcc alpine-sdk

# Disk Utils
sudo apk add --no-cache util-linux e2fsprogs cfdisk e2fsprogs-extra

# Development Tools (Uncomment if needed)
# apk add git gdb valgrind

# Virtualization Tools
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk

# GUI & Display Managers (Uncomment if needed)
# apk add sudo build-base setxkbmap xrandr bash zsh dbus dbus-x11 setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
# apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu mesa-gl glib feh firefox-esr accountsservice openvpn

# System Monitoring Tools
apk add htop atop vtop gtop bashtop glances nmon

# Networking & Security Tools
apk add openvpn

# Cleaning up cache
apk chache clean
rm -rf /var/cache/apk/*
