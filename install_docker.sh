#!/bin/ash

# Update and upgrade the system to ensure it has the latest packages
echo "Updating and upgrading the system..."
apk update
apk upgrade

# Install necessary dependencies for Docker
echo "Installing dependencies..."
apk add curl ca-certificates libseccomp openrc

# Remove any existing Docker packages that might conflict
# The command continues even if these packages are not found
echo "Removing existing Docker packages..."
apk del docker docker-engine docker.io containerd runc || true

# Perform a general system cleanup
echo "Performing general system cleanup..."
apk cache clean

# Install Docker and Docker Compose
echo "Installing Docker and Docker Compose..."
apk add docker docker-compose

# Add Docker to start on boot and start the Docker service immediately
echo "Configuring Docker to start on boot and starting Docker service..."
rc-update add docker boot
service docker start


# Name of the user to be added to the Docker group
USERNAME="user"

# Check if Docker is installed by looking for the Docker command
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Ensure the Docker group exists, create if it does not
if ! getent group docker; then
    echo "Docker group does not exist. Creating Docker group..."
    sudo addgroup docker
fi

# Add the user to the Docker group
echo "Adding $USERNAME to the Docker group..."
sudo addgroup $USERNAME docker

# Inform the user that they need to log out and back in for the changes to take effect
echo "Please log out and log back in for the changes to take effect."

# Optional: Set permissions on the Docker socket for immediate effect
# echo "Setting permissions on the Docker socket..."
# sudo chown "$USERNAME":docker /var/run/docker.sock

# Optional setup: Adding a non-root user to the Docker group
# This allows the user to run Docker commands without needing root access
# Uncomment the following lines and replace "username" with the actual username
# echo "Adding user to the Docker group..."
# addgroup username docker
# Inform the user to log out and back in for group changes to take effect
# echo "Please log out and log in again for the Docker group changes to take effect."

echo "Docker installation and configuration completed."
