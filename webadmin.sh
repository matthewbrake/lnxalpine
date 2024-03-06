# Web admin setup

# https://wiki.alpinelinux.org/wiki/Webmin


#!/bin/sh

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install Perl and necessary Perl module for SSL
apk add perl perl-net-ssleay

# Download and install Webmin
cd /opt
wget https://github.com/webmin/webmin/archive/refs/tags/1.991.tar.gz
tar -xzf 1.991.tar.gz
mv webmin-1.991 webmin
cd webmin

# Prepare answers for the setup script and run it
AUTO_SETUP=./auto_setup.sh
cat <<EOF > $AUTO_SETUP
/usr/local/webmin
/var/log/webmin
/usr/bin/perl
84
ES4.0
10000
admin
admin-password
admin-password
n
y
EOF

./setup.sh /usr/local/webmin < $AUTO_SETUP

# Cleanup
rm -f ../1.991.tar.gz
rm -f $AUTO_SETUP

echo "Webmin installation complete."
echo "You can access the Webmin panel at http://IP_NUMBER:10000"
