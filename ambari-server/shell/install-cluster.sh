#!/bin/bash

./ambari-shell.sh << EOF
blueprint add --url https://raw.githubusercontent.com/sequenceiq/ambari-rest-client/2.2.11/src/main/resources/blueprints/multi-node-hdfs-yarn
blueprint add --url https://raw.githubusercontent.com/sequenceiq/ambari-rest-client/2.2.11/src/main/resources/blueprints/single-node-hdfs-yarn
cluster build --blueprint $BLUEPRINT
cluster autoAssign
cluster create --exitOnFinish true
EOF

{
  "host_groups": [
    {
      "name": "master",
      "components": [
        {
          "name": "NAMENODE"
        },
        {
          "name": "SECONDARY_NAMENODE"
        },
        {
          "name": "RESOURCEMANAGER"
        },
        {
          "name": "HISTORYSERVER"
        },
        {
          "name": "APP_TIMELINE_SERVER"
        },
        {
          "name": "ZOOKEEPER_SERVER"
        }, 
        {
          "name" : "METRICS_COLLECTOR"
        },
        {
          "name" : "METRICS_MONITOR"
        }
    ],
      "cardinality": "1"
    },
    {
      "name": "slave_1",
      "components": [
        {
          "name": "DATANODE"
        },
        {
          "name": "HDFS_CLIENT"
        },
        {
          "name": "NODEMANAGER"
        },
        {
          "name": "YARN_CLIENT"
        },
        {
          "name": "MAPREDUCE2_CLIENT"
        },
        {
          "name": "ZOOKEEPER_CLIENT"
        },
        {
          "name" : "METRICS_MONITOR"
        }
      ],
      "cardinality": "1+"
    }
  ],
  "Blueprints": {
    "blueprint_name": "multi-node-hdfs-yarn",
    "stack_name": "HDP",
    "stack_version": "2.4"
  }
}