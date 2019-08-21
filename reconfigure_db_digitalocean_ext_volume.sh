#!/bin/bash

./scripts/configure_mount_volume.sh && \
service mongod start && \
./scripts/create_self_cert_mongodb.sh && \
./scripts/set_mongodb_password.sh
