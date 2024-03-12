echo "Updating and upgrading the system..."
apk update
apk upgrade

echo "Installing dependencies..."
apk add curl ca-certificates libseccomp openrc

echo "Removing existing Docker packages..."
apk del docker docker-engine docker.io containerd runc || true  # Continue even if these packages are not found

echo "Installing Docker..."
apk add docker docker-compose
rc-update add docker boot
service docker start
