#!/bin/ash
#
# Alpine Linux Essentials Packages
# By Dimas Restu Hidayanto <dimas.restu@student.upi.edu>
#
# WARNING PLEASE DO WITH YOUR OWN RISK
#
# This instruction will guide you to install
# essentials packages that might be useful for your systems
# or your opeartions
#
# Please do the following command before applying
# ...
# sudo -i
# -- Or --
# su
# ...
#

# Install GLIBC Packages
GLIBC_VERSION=2.33-r0

apk add --no-cache --update wget gzip
wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk
apk add --no-cache --update glibc-${GLIBC_VERSION}.apk libstdc++

ln -sf /usr/glibc-compat/lib/ld-linux-x86-64.so.2 /usr/glibc-compat/lib/ld-linux-x86-64.so
ln -sf /usr/glibc-compat/lib/libBrokenLocale.so.1 /usr/glibc-compat/lib/libBrokenLocale.so
ln -sf /usr/glibc-compat/lib/libanl.so.1 /usr/glibc-compat/lib/libanl.so
ln -sf /usr/glibc-compat/lib/libcrypt.so.1 /usr/glibc-compat/lib/libcrypt.so
ln -sf /usr/glibc-compat/lib/libdl.so.2 /usr/glibc-compat/lib/libdl.so
ln -sf /usr/glibc-compat/lib/libmvec.so.1 /usr/glibc-compat/lib/libmvec.so
ln -sf /usr/glibc-compat/lib/libnsl.so.1 /usr/glibc-compat/lib/libnsl.so
ln -sf /usr/glibc-compat/lib/libnss_compat.so.2 /usr/glibc-compat/lib/libnss_compat.so
ln -sf /usr/glibc-compat/lib/libnss_db.so.2 /usr/glibc-compat/lib/libnss_db.so
ln -sf /usr/glibc-compat/lib/libnss_dns.so.2 /usr/glibc-compat/lib/libnss_dns.so
ln -sf /usr/glibc-compat/lib/libnss_files.so.2 /usr/glibc-compat/lib/libnss_files.so
ln -sf /usr/glibc-compat/lib/libnss_hesiod.so.2 /usr/glibc-compat/lib/libnss_hesiod.so
ln -sf /usr/glibc-compat/lib/libpthread.so.0 /usr/glibc-compat/lib/libpthread.so
ln -sf /usr/glibc-compat/lib/libresolv.so.2 /usr/glibc-compat/lib/libresolv.so
ln -sf /usr/glibc-compat/lib/librt.so.1 /usr/glibc-compat/lib/librt.so
ln -sf /usr/glibc-compat/lib/libthread_db.so.1 /usr/glibc-compat/lib/libthread_db.so
ln -sf /usr/glibc-compat/lib/libutil.so.1 /usr/glibc-compat/lib/libutil.so
rm -f glibc-${GLIBC_VERSION}.apk

wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-bin-2.27-r0.apk
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-i18n-2.27-r0.apk
apk add --no-cache --update glibc-bin-2.27-r0.apk glibc-i18n-2.27-r0.apk

gunzip --keep /usr/glibc-compat/share/i18n/charmaps/UTF-8.gz
/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
echo "export LANG=$LANG" > /etc/profile.d/locale.sh

apk del --no-cache glibc-bin glibc-i18n
rm -f glibc-bin-2.27-r0.apk glibc-i18n-2.27-r0.apk
rm -f /usr/glibc-compat/share/i18n/charmaps/UTF-8
rm -f /etc/apk/keys/sgerrand.rsa.pub
rm -f /root/.wget-hsts

# Install and Upgrade Base Packages
apk upgrade --no-cache --update
apk add --no-cache --update bash bash-completion
apk add --no-cache --update ca-certificates tzdata
apk add --no-cache --update sudo sed grep byobu
apk add --no-cache --update curl wget rsync nano vim
apk add --no-cache --update tar gzip bzip2 xz p7zip zip unzip
apk add --no-cache --update e2fsprogs xfsprogs gdisk parted lvm2
apk add --no-cache --update binutils util-linux logrotate
apk add --no-cache --update gnupg
apk add --no-cache --update htop iftop iotop sysstat nmon
apk add --no-cache --update net-tools netcat socat bind-utils bridge-utils
apk add --no-cache --update traceroute iputils openssh-clients
apk add --no-cache --update open-vm-tools

# Install Development Tools Packages
apk add --no-cache --update python2 python2-dev
apk add --no-cache --update python3 python3-dev
apk add --no-cache --update git

# Install Python 2 PIP
wget -q -O - https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 -
pip2 install --no-cache-dir --upgrade pip setuptools wheel
pip2 install --no-cache-dir virtualenv pipreqs pylint

# Install Python 3 PIP
wget -q -O - https://bootstrap.pypa.io/get-pip.py | python3 -
pip3 install --no-cache-dir --upgrade pip setuptools wheel
pip3 install --no-cache-dir virtualenv pipreqs pylint

# Configure Executable
mv /usr/bin/sh /usr/bin/sh.orig~
mv /usr/bin/vi /usr/bin/vi.orig~
ln -sf /bin/bash /bin/sh
ln -sf /usr/bin/vim /usr/bin/vi

# Enable Sysctl Tweaks
cat << EOF >> /etc/sysctl.conf
vm.max_map_count=262144
net.core.somaxconn=4096
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.core.netdev_max_backlog=2500
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
net.ipv6.conf.eth0.disable_ipv6=1
net.ipv4.tcp_mem=116730 155640 233460
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
net.ipv4.tcp_max_orphans=24576
net.ipv4.ip_no_pmtu_disc=0
net.ipv4.conf.all.rp_filter=1
net.ipv4.conf.all.log_martians=1
net.ipv4.conf.all.accept_source_route=0
net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.default.send_redirects=0
net.ipv4.icmp_echo_ignore_broadcasts=1
EOF

# Reload Sysctl
sysctl -p
