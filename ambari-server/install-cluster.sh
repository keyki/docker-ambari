#!/bin/bash

./ambari-shell.sh << EOF
blueprint defaults
blueprint add --url https://gist.githubusercontent.com/keyki/1c62d179a5fef98aad92/raw/e5052566fa3aa75d325b66726933d388edf3d8cd/multinode-with-tez
blueprint add --url https://gist.githubusercontent.com/keyki/09c6469b649caa1c66f1/raw/124dd2f337a529c825f45d0b472b03fca2634d51/singlenode-with-tez
cluster build --blueprint $BLUEPRINT
cluster autoAssign
cluster create --exitOnFinish true
EOF

if [[ "$BLUEPRINT" =~ .*-tez  ]]; then
  ./ambari-shell.sh << EOF
  configuration modify --type mapred-site --key mapreduce.framework.name --value yarn-tez
  exit
EOF
fi
