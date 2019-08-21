#!/bin/bash

export DATA_DIR=/data/db
export MONGODB_USER=admin

export MONGODB_PASS=${MONGODB_PASS:-$(pwgen -s 32 1)}

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo --ssl admin --sslAllowInvalidCertificates --eval "help" > /dev/null 2>&1
    RET=$?
done

echo 'rs.initiate()' | mongo admin --sslAllowInvalidCertificates --ssl
sleep 10

echo "=> Creating an admin user with a ${MONGODB_PASS} password in MongoDB"

mongo admin --ssl --sslAllowInvalidCertificates --eval "db.createUser({user: 'admin', pwd: '$MONGODB_PASS', roles:[{role:'root',db:'admin'}]});"
#mongo admin --ssl --sslAllowInvalidCertificates --eval "db.createUser({user: 'admin', pwd: 'admin', roles:[{role:'root',db:'admin'}]});"

echo "========================================================================"
echo "You can now connect to this MongoDB server using:"
echo ""
echo "    mongo admin --sslAllowInvalidCertificates --ssl -u admin -p $MONGODB_PASS --host 127.0.0.1 --port 27017"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
