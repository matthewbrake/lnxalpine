#!/bin/sh

# Ensure your system is up-to-date
sudo apk update
sudo apk upgrade

# Alpine base
sudo apk add alpine-base alpine-keys alpine-sdk busybox build-base
apk add --update alpine-sdk



# VM Tools
echo "@vmware https://packages.vmware.com/packages/esx/7.0.0" >> /etc/apk/repositories && sudo apk add open-vm-tools open-vm-tools-plugins-all open-vm-tools-guestinfo open-vm-tools-deploypkg && sudo rc-service open-vm-tools start && sudo rc-update add open-vm-tools default
# Package Categories

# 1. Essential Utilities
sudo apk add sudo openntpd bash zsh fish nano vim neovim emacs curl wget btop git tmux screen htop atop iotop tree pv jq file grep sed gawk less tar gzip bzip2 xz zip unzip which findutils coreutils binutils util-linux moreutils cifs-utils nfs-utils samba


# 2. Networking Tools
sudo apk add net-tools bind-tools iproute2 nmap iftop iperf3 traceroute whois openssh-client openssh-server sshpass wireless-tools wireshark tshark ethtool wpa_supplicant proxychains-ng socat nethogs iputils tcpdump 

# 3. Security and Encryption
sudo apk add fail2ban iptables nftables clamav rkhunter gnupg openssl openvpn wireguard-tools

# 4. System Monitoring and Performance
sudo apk add btop sysstat dstat glances logrotate lsof strace perf htop ntop bpytop iftop ncdu

# 5. Compression and Archiving
sudo apk add p7zip lz4

# 6. Disk Utilities and File Systems
sudo apk add e2fsprogs xfsprogs dosfstools ntfs-3g lvm2 mdadm smartmontools gparted hdparm mtools cryptsetup

# 7. Development Tools and Libraries
sudo apk add build-base linux-headers gdb valgrind ctags git-lfs cmake autoconf automake libtool m4 gcc g++ make patch libc6-compat glibc libgcc libstdc++ musl libintl libcrypto1.1 libssl1.1 zlib libbz2 expat libffi musl-utils readline ncurses-libs ncurses-terminfo-base ca-certificates

# 8. Programming Languages and Frameworks
sudo apk add python3 py3-pip ruby nodejs npm go rust cargo php perl

# 9. Web Servers and Reverse Proxies
sudo apk add nginx apache2 lighttpd tomcat-native varnish squid

# 10. Database Servers
sudo apk add postgresql mysql mariadb-client sqlite mongodb redis

# 11. Containerization and Virtualization
sudo apk add docker docker-compose podman

# 12. File Sharing and Synchronization
sudo apk add rsync nfs-utils samba samba-common cifs-utils samba-client syncthing curlftpfs

# 13. Multimedia Tools
sudo apk add ffmpeg vlc imagemagick graphicsmagick

# 14. Document Processing
sudo apk add pandoc texlive

# 15. Email Clients and Utilities
sudo apk add mutt postfix dovecot

# 16. Fonts and Theming
sudo apk add fontconfig noto-fonts ttf-dejavu

# 17. Remote Access and File Transfer
sudo apk add openssh vsftpd

# 18. Monitoring Dashboards
sudo apk add grafana prometheus

# 19. Log Management
sudo apk add logrotate rsyslog

# 20. Backup Solutions
sudo apk add rsnapshot duplicity

# 21. Custom Shell Prompt
sudo apk add starship

echo "Installation of packages is complete. Please review and customize as needed."
