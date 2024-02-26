#!/bin/ash

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service open-vm-tools start
rc-update add open-vm-tools boot

rc-service docker start
rc-update add docker boot

rc-service sshd start
rc-update add sshd boot

# Portainer Agent
docker run -d \
  -p 9001:9001 \
  --name portainer_agent \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent:2.19.4
#!/bin/sh

# Backup the original sshd_config file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Enable root login via SSH
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart OpenSSH service
service sshd restart

echo "Root SSH login enabled. Please make sure to secure your system and use this with caution."
