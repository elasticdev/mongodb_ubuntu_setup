#!/bin/bash

mkdir -p /etc/ssl

openssl req -newkey rsa:2048 -new -x509 -subj "/C=US/ST=California/L=SanFrancisco/O=Dis/CN=www.selfsigned.com" -days 1024 -nodes -out mongodb.crt -keyout mongodb.key && \
bash -c 'cat mongodb.crt mongodb.key > /etc/ssl/mongodb.pem'

pwd

cp -rp mongod.conf /etc/mongod.conf
service mongod restart
