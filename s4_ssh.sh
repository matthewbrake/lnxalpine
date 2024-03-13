#!/bin/sh

# SSH Change to allow root
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Enable root login via SSH
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart OpenSSH service
service sshd restart

echo "Root SSH login enabled. Please make sure to secure your system and use this with caution."
