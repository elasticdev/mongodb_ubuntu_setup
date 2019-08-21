#!/bin/bash

rm -rf /var/lib/mongodb/*

mkfs.xfs /dev/sda && \
echo "/dev/sda  /var/lib/mongodb xfs defaults,nofail,discard 0 0" >> /etc/fstab && \
mount /var/lib/mongodb
