#!/bin/ash

# Extract the Alpine Linux version from /etc/alpine-release
alpineversion=$(cat /etc/alpine-release | cut -d "." -f 1-2 | awk '{print "v"$1}')

# Construct repository URLs for main, community, and edge/testing repositories
main_repo="http://dl-cdn.alpinelinux.org/alpine/$alpineversion/main"
community_repo="http://dl-cdn.alpinelinux.org/alpine/$alpineversion/community"
edge_repo="http://dl-cdn.alpinelinux.org/alpine/edge/testing"

# Add the repository URLs to /etc/apk/repositories
echo "$community_repo" >> /etc/apk/repositories
echo "$main_repo" >> /etc/apk/repositories
echo "$edge_repo" >> /etc/apk/repositories

# Update package indexes
apk update
