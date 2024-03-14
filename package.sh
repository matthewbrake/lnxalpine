#!/bin/ash

# Update apk repositories
apk update
apk upgrade

# Essential Tools
apk add sudo curl nano wget tzdata musl vim ca-certificates libseccomp socat nmap net-tools nfs-utils iptables busybox-extras openssh bash bash-doc bash-completion dpkg rpm make gcc python-dev automake autoconf libtool openssl openssl-dev libgcc alpine-sdk
apk add busybox-extras


#  Download and install glibc (required for certain applications)
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
apk add glibc-2.28-r0.apk

# Disk Utils
sudo apk add --no-cache util-linux e2fsprogs cfdisk e2fsprogs-extra


# Cleaning up cache
apk chache clean
rm -rf /var/cache/apk/*
