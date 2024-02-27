#!/bin/sh

# Disable IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf

# Apply sysctl configuration to disable IPv6 immediately
sudo sysctl -p

# Flush IPv6 addresses from eth0 interface
sudo ip -6 addr flush dev eth0

# Flush IPv4 addresses from eth0 interface
sudo ip addr flush dev eth0

# Assign desired IPv4 address (10.0.0.78) to eth0 interface
sudo ip addr add 10.0.0.XX dev eth0  #  <---- Confgiure this 

# Set default gateway via 10.0.0.1
sudo ip route add default via 10.0.0.1

# Assign loopback IPv4 address (127.0.0.1) to lo interface
sudo ip addr add 127.0.0.1/8 dev lo

# Configure DNS resolution with provided nameservers (8.8.8.8 and 75.75.75.75)
echo -e "nameserver 8.8.8.8\nnameserver 75.75.75.75" | sudo tee /etc/resolv.conf
