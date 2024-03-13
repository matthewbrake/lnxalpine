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

# Optional setup: Adding a non-root user to the Docker group
# This allows the user to run Docker commands without needing root access
# Uncomment the following lines and replace "username" with the actual username
# echo "Adding user to the Docker group..."
# addgroup username docker
# Inform the user to log out and back in for group changes to take effect
# echo "Please log out and log in again for the Docker group changes to take effect."

echo "Docker installation and configuration completed."
