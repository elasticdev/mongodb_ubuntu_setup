#!/bin/bash

service mongod start && \
rm -rf /var/lib/mongodb/* && \
./scripts/create_self_cert_mongodb.sh && \
./scripts/set_mongodb_password.sh
