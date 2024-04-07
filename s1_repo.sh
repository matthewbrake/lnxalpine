#!/bin/ash

alpineversion=`cat /etc/alpine-release | cut -d "." -f 1-2 | awk '{print "v"$1}'`
echo $alpineversion

echo "http://dl-cdn.alpinelinux.org/alpine/$alpineversion/community" >> /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/$alpineversion/main" >> /etc/apk/repositories
echo "@vmware https://packages.vmware.com/packages/esx/7.0.0" >> /etc/apk/repositories

apk update
apk upgrade

