#!/bin/bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \

apt-get update && \

apt-get install -y pwgen wget curl git-core build-essential scons devscripts lintian dh-make \
libpcre3 libpcre3-dev libboost-dev libboost-date-time-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-thread-dev \
libpcap-dev libreadline-dev libssl-dev rng-tools libcurl3 openssl

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

apt-get update

apt-get install -y mongodb-org
