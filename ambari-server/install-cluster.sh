#!/bin/bash

./ambari-shell.sh << EOF
blueprint defaults
blueprint add --url https://gist.githubusercontent.com/keyki/1c62d179a5fef98aad92/raw/6f3ee799e13febb59387a74b810be1a0008ec75f/multinode-with-tez
blueprint add --url https://gist.githubusercontent.com/keyki/09c6469b649caa1c66f1/raw/a750a012e9c1fb741701b2879afbee3de15c6bdb/singlenode-with-tez
cluster build --blueprint $BLUEPRINT
cluster autoAssign
cluster create --exitOnFinish true
EOF

SERF_RPC_ADDR=${AMBARISERVER_PORT_7373_TCP##*/}
serf event --rpc-addr=$SERF_RPC_ADDR copy
