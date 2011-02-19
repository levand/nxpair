#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./addkey.sh <keyfile>"
  exit 1
fi

KEYFILE=$1

#Add the key to /home/pair/.ssh/authorized_keys
cat $KEYFILE >> /home/pair/.ssh/authorized_keys

#Add the key to /usr/NX/home/nx/.ssh/authorized_keys2
PREPEND="no-port-forwarding,no-agent-forwarding,command=\"/usr/NX/bin/nxserver --login\" "
CONTENT=`cat $KEYFILE`
echo $PREPEND$CONTENT >> /usr/NX/home/nx/.ssh/authorized_keys2

