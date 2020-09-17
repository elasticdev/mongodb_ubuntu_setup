#!/bin/bash

export DISK=/dev/nvme1n1

service mongod stop
rm -rf /var/lib/mongodb/*

mkfs.xfs $DISK && \
echo "$DISK  /var/lib/mongodb xfs defaults,nofail,discard 0 0" >> /etc/fstab && \
mount /var/lib/mongodb && \
chown -R mongodb:mongodb /var/lib/mongodb
