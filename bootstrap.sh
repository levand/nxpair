#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./bootstrap.sh <pair-user-password>"
  exit 1
fi

PASSWORD=$1

# Install desktop env required by NX, and useful packages
apt-get update
apt-get -y install ubuntu-desktop libaudiofile0 git-core emacs23

# Install NX
rm *.deb
wget -nc http://64.34.161.181/download/3.4.0/Linux/nxclient_3.4.0-7_x86_64.deb
wget -nc http://64.34.161.181/download/3.4.0/Linux/nxnode_3.4.0-16_x86_64.deb
wget -nc http://64.34.161.181/download/3.4.0/Linux/FE/nxserver_3.4.0-17_x86_64.deb

dpkg -i ~/nxclient_3.4.0-7_x86_64.deb
dpkg -i ~/nxnode_3.4.0-16_x86_64.deb
dpkg -i ~/nxserver_3.4.0-17_x86_64.deb

# Create & configure pair user
useradd -m -s/bin/bash pair
echo -e "$PASSWORD\n$PASSWORD" | passwd pair
mkdir -p /home/pair/.ssh
ssh-keygen -f /home/pair/.ssh/pair_key -N ""
chown -R pair /home/pair/.ssh/
echo 'pair  ALL=(ALL) ALL' >> /etc/sudoers

# Configure pair user for use with NX
/usr/NX/bin/nxserver --keygen
/usr/NX/bin/nxserver --useradd pair

# Enable password-based ssh login (ugly, but NX requires it)
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart


