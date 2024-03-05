#!/bin/sh
# Script to install Wazuh on Alpine Linux using APK package manager
# https://documentation.wazuh.com/current/deployment-options/wazuh-from-sources/wazuh-agent/index.html 

# Update the package index
apk update

# Install necessary build dependencies
apk add automake autoconf cmake curl gcc gettext-dev g++ linux-headers libgcc libtool make procps python3 openssl-dev

# Download and extract the latest version of Wazuh
curl -Ls https://github.com/wazuh/wazuh/archive/v4.7.3.tar.gz | tar zx

# Run the install.sh script to guide through the installation process
cd wazuh-4.7.3
./install.sh


# Optional: Clean the build if previously compiled for another platform
# cd wazuh-4.7.3
# make -C src clean
# make -C src clean-deps

# Start Wazuh Service
sudo  /var/ossec/bin/wazuh-control start

echo "Wazuh installation completed."
