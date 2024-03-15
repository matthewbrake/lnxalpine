#!/bin/ash

# run setup-user?

# add user
echo "Creating a new user 'user' with sudo privileges..."
apk add sudo
adduser -D user
echo "user:password" | chpasswd
echo "user ALL=(ALL) ALL" >> /etc/sudoers




# Optionally, set Bash as the default shell for the new user
echo "Setting Bash as the default shell for the new user..."
echo "/bin/bash" >> /etc/shells

# add user to sudoers
cat ./user/sudoers >> /etc/sudoers



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




