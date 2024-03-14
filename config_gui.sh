#!/bin/ash

# Ensure the system is updated before proceeding
echo "Updating the system..."
apk update
apk upgrade

# Display managers 
# apk add sudo build-base setxkbmap xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
#apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add htop atop vtop btop gtop bashtop glances nmon

# Install necessary packages for GUI setup
echo "Installing Xorg and essential GUI packages..."
apk add xorg-server xfce4 xfce4-terminal lightdm lightdm-gtk-greeter dbus-x11 accountsservice

# Optional: Install additional XFCE applications and utilities
echo "Installing additional XFCE utilities..."
apk add thunar-volman tumbler xfce4-screenshooter xfce4-taskmanager

# Install window manager and utilities
echo "Installing i3 window manager and utilities..."
apk add i3wm i3status dmenu i3lock

# Setting up user environment
echo "Setting up user environment..."
mkdir -p /home/user/wallpaper
mkdir -p /home/user/.config/i3
mkdir -p /home/user/.scripts

# Copy user files and set permissions
echo "Copying user configurations and setting permissions..."
cp ./user/wallpaper/compass.jpg /home/user/wallpaper/compass.jpg
cp ./user/.config/i3/config /home/user/.config/i3/config
cp ./user/.profile /home/user/.profile
cp ./user/login-script.sh /home/user/.scripts/login-script.sh
chown -R user:user /home/user

# Configure account service for user background
echo "Configuring account service for user background..."
cp ./user/user /var/lib/AccountsService/users/user
chown root:root /var/lib/AccountsService/users/user

# Configure LightDM greeter background
echo "Configuring LightDM greeter..."
echo "background=/home/user/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# Starting and enabling LightDM service
echo "Enabling and starting LightDM..."
rc-update add lightdm
service lightdm start

# Optional configurations and notes
# To enable auto-login for a specific user in LightDM, you can modify /etc/lightdm/lightdm.conf
# Uncomment and edit the following lines in the script or manually:
# echo "Enabling auto-login for user..."
# echo "[Seat:*]" >> /etc/lightdm/lightdm.conf
# echo "autologin-user=user" >> /etc/lightdm/lightdm.conf

echo "GUI setup is complete. Reboot your system for all changes to take effect."





###### ORGINALS ####


# set background image in accountsservice
cp ./user/user /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/user

# greeter background
echo "background=/home/user/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# user setup user
mkdir -p /home/user/wallpaper
mkdir -p /home/user/.config/i3

cp ./user/wallpaper/compass.jpg /home/user/wallpaper/compass.jpg
cp ./user/.config/i3/config /home/user/.config/i3/config
cp ./user/.profile /home/user/.profile
mkdir -p /home/user/.scripts
cp ./user/login-script.sh /home/user/.scripts/login-script.sh
chown -R user:user /home/user
