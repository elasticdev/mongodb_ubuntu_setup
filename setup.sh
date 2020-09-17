#!/bin/bash

./scripts/install_mongodb.sh
./scripts/create_self_cert_mongodb.sh
./scripts/stop_db.sh
./scripts/configure_mount_volume.sh
cp -rp ./files/mongod.conf /etc/mongod.conf
./scripts/start_db.sh
./scripts/set_mongodb_password.sh
