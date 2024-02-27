#!/bin/sh

# Set the hostname
NEW_HOSTNAME="LNX-ALP-NODE-01"
echo $NEW_HOSTNAME | sudo tee /etc/hostname

# Update /etc/hosts
sudo sed -i "s/127.0.0.1.*/127.0.0.1\t$NEW_HOSTNAME localhost/" /etc/hosts
sudo sed -i "s/::1.*/::1\t\t$NEW_HOSTNAME localhost/" /etc/hosts

# Apply the new hostname
sudo hostname $NEW_HOSTNAME

echo "Hostname updated to $NEW_HOSTNAME"
