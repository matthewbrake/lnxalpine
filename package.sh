#!/bin/ash

# Update apk repositories
apk update
apk upgrade
apk alpine-sdk

# Essential Tools
apk add sudo curl nano wget tzdata musl vim ca-certificates libnice-gstreamer libseccomp socat nmap net-tools nfs-utils iptables busybox-extras openssh bash bash-doc bash-completion dpkg rpm make gcc automake autoconf libtool openssl openssl-dev libgcc alpine-sdk
apk add busybox-extras
apk add open-vm-tools

#  Download and install glibc (required for certain applications)
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
apk add glibc-2.28-r0.apk

# Disk Utils
sudo apk add --no-cache util-linux e2fsprogs cfdisk e2fsprogs-extra


# Essential Packages (50)
apk add curl wget tzdata musl libseccomp socat nmap net-tools nfs-utils iptables busybox-extras openssh bash bash-doc bash-completion ca-certificates sudo shadow coreutils grep sed findutils diffutils tar gzip unzip bzip2 zip rsync man man-pages gettext libffi libffi-dev openssl openssl-dev zlib zlib-dev libyaml libyaml-dev bison flex libxml2 libxml2-dev libxslt libxslt-dev libgcrypt libgcrypt-dev libssl libssl-dev libcurl libcurl-dev libicu libicu-dev libpng libpng-dev libjpeg-turbo libjpeg-turbo-dev libtiff libtiff-dev libwebp libwebp-dev

# Dependencies (100)
apk add make gcc g++ clang gdb valgrind cmake ninja build-essential pkg-config libffi-dev libffi-dev libyaml-dev zlib-dev bison flex libxml2-dev libxslt-dev libgcrypt-dev libssl-dev libcurl-dev libicu-dev libpng-dev libjpeg-turbo-dev libtiff-dev libwebp-dev libx11-dev libxext-dev libxrender-dev libxrandr-dev libxi-dev libxt-dev libxxf86vm-dev libxinerama-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxv-dev libxcb-dev libxkbcommon-dev libxkbcommon-x11-dev libwayland-dev libgtk-3-dev libglfw3-dev libpulse-dev libsdl2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-p

# Optional Packages (50)
apk add htop iotop sysstat strace lsof ltrace iftop atop tcpdump bind-tools netcat iputils iproute2 gnupg imagemagick graphicsmagick nginx apache2-utils mysql-client postgresql-client sqlite php7 php7-cli php7-common php7-dev php7-pear php7-mbstring php7-mysqli php7-pdo php7-json php7-openssl php7-curl php7-gd php7-iconv php7-session php7-xml php7-zip php7-mysqlnd php7-pdo_mysql php7-pdo_sqlite php7-simplexml php7-tokenizer php7-xmlreader php7-xmlwriter php7-phar php7-dom php7-intl php7-ctype php7-mcrypt php7-soap php7-xdebug php7-bcmath php7-zlib php7-sockets php7-posix php7-opcache php7-ldap php7-fileinfo php7-gettext php7-imap php7-redis php7-xmlrpc php7-gmp php7-memcached php7-exif php7-pcntl php7-ftp php7-pspell php7-calendar php7-sodium php7-imagick php7-ssh2 php7-bz2 php7-tidy php7-ffi php7-mongodb php7-sqlite3 php7-xsl php7-mbstring php7-soap php7-dev libffi-dev libffi-dev libyaml-dev zlib-dev bison flex libxml2-dev libxslt-dev libgcrypt-dev libssl-dev libcurl-dev libicu-dev libpng-dev libjpeg-turbo-dev libtiff-dev libwebp-dev libx11-dev libxext-dev libxrender-dev libxrandr-dev libxi-dev libxt-dev libxxf86vm-dev libxinerama-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxv-dev libxcb-dev libxkbcommon-dev libxkbcommon-x11-dev libwayland-dev libgtk-3-dev libglfw3-dev libpulse-dev libsdl2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-p

# Developer Tools (50)
apk add git subversion mercurial gcc g++ clang gdb valgrind cmake ninja php7-dev php7-pear python3-dev py3-pip nodejs npm ruby ruby-dev perl perl-dev libx11-dev libxext-dev libxrender-dev libxrandr-dev libxi-dev libxt-dev libxxf86vm-dev libxinerama-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxv-dev libxcb-dev libxkbcommon-dev libxkbcommon-x11-dev libwayland-dev libgtk-3-dev libglfw3-dev libpulse-dev libsdl2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-pbutils1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-ugly1.0-dev libgstreamer-vaapi1.0-dev libgstreamer-app1.0-dev libgstreamer-rtp1.0-dev libgstreamer-rtsp1.0-dev libgstreamer-sdp1.0-dev libgstreamer-tag1.0-dev libgstreamer-video1.0-dev libgstreamer-audio1.0-dev libgstreamer-gl1.0-dev libgstreamer-allocators1.0-dev libgstreamer-net1.0-dev libgstreamer-fft1.0-dev libgstreamer-riff1.0-dev libgstreamer-p

# Essential Packages
apk add curl wget tzdata musl libseccomp socat nmap net-tools nfs-utils iptables busybox-extras openssh bash bash-doc bash-completion ca-certificates sudo shadow coreutils grep sed findutils diffutils tar gzip unzip bzip2 zip rsync man man-pages gettext libffi openssl zlib libyaml bison flex libxml2 libxslt libgcrypt libssl libcurl libicu libpng libjpeg-turbo libtiff libwebp

# Dependencies
apk add make gcc clang gdb valgrind cmake ninja build-essential pkg-config readline ncurses zlib-dev libpng-dev libjpeg-turbo-dev libwebp-dev

# Optional Packages
apk add htop iotop sysstat strace lsof ltrace iftop atop tcpdump bind-tools netcat iputils iproute2 gnupg imagemagick graphicsmagick nginx apache2-utils mysql-client postgresql-client sqlite php7 nginx

# Developer Tools
apk add git subversion mercurial gcc g++ clang gdb valgrind cmake ninja python3-dev ruby-dev nodejs-dev go rust # Adjust based on your languages

# Potential Base Packages for Additional Functionality
apk add gstreamer # For audio/video if needed
apk add libx11-dev libxext-dev libxrender-dev libxrandr-dev libxi-dev libxt-dev libxxf86vm-dev libxinerama-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxv-dev libxcb-dev libxkbcommon-dev # X11 development
apk add libwayland-dev libgtk-3-dev libglfw3-dev libpulse-dev libsdl2-dev # Graphics toolkit development

# Cleaning up cache
apk chache clean
rm -rf /var/cache/apk/*
