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




# Add to boot

# Script: /etc/init.d/wazuh-agent
# Description: Init script for Wazuh agent
# chkconfig: 2345 20 80

### BEGIN INIT INFO
# Provides:          wazuh-agent
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Wazuh agent service
# Description:       This script manages the Wazuh agent service.
### END INIT INFO

# Source function library.
. /etc/init.d/functions

# Set the path to the Wazuh control script
WAZUH_CONTROL="/var/ossec/bin/wazuh-control"

# Define the service name
SERVICE_NAME="wazuh-agent"

# Define the service description
DESCRIPTION="Wazuh agent"

# Check if the Wazuh control script exists
if [ ! -x "$WAZUH_CONTROL" ]; then
    echo "$SERVICE_NAME control script not found or not executable"
    exit 1
fi

# Function to start the service
start() {
    ebegin "Starting $DESCRIPTION"
    $WAZUH_CONTROL start $SERVICE_NAME
    eend $?
}

# Function to stop the service
stop() {
    ebegin "Stopping $DESCRIPTION"
    $WAZUH_CONTROL stop $SERVICE_NAME
    eend $?
}

# Main control logic
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit $?

#


echo "Wazuh installation completed."
