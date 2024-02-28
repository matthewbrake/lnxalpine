#!/bin/ash

apk add curl nano ca-certificates libseccomp socat nmap net-tools build-base setxkbmap sudo xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add htop atop vtop gtop bashtop glances nmon
apk add docker docker-compose
apk add bash bash-doc bash-completion
apk add openssh
apk add dpkg rpm
apk add nfs-util

# add user
echo "Creating a new user 'user' with sudo privileges..."
apk add sudo
adduser -D user
echo "user:password" | chpasswd
echo "user ALL=(ALL) ALL" >> /etc/sudoers


# user setup user
mkdir -p /home/user/wallpaper
mkdir -p /home/user/.config/i3

cp ./user/wallpaper/compass.jpg /home/user/wallpaper/compass.jpg
cp ./user/.config/i3/config /home/user/.config/i3/config
cp ./user/.profile /home/user/.profile
mkdir -p /home/user/.scripts
cp ./user/login-script.sh /home/user/.scripts/login-script.sh
chown -R user:user /home/user

# Optionally, set Bash as the default shell for the new user
echo "Setting Bash as the default shell for the new user..."
echo "/bin/bash" >> /etc/shells

# add user to sudoers
cat ./user/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/user/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./user/user /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/user

# add user to docker
addgroup user docker

# enable copy paste in vmware
chmod g+s /usr/bin/vmware-user-suid-wrapper

# give user write access to /opt dir
chown user:user /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown user:user /opt/docker

# Firewall allow
echo "Configuring the firewall for SSH..."
apk add iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
/etc/init.d/iptables save

# Clean up
echo "Removing existing Docker packages..."
apk del docker docker-engine docker.io containerd runc || true  # Continue even if these packages are not found
echo "Performing general system cleanup..."
apk cache clean



