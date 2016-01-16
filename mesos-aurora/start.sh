#!/bin/bash

mesos-log initialize --path=/var/lib/aurora/scheduler/db 

aurora-scheduler \
  -cluster_name=$AURORA_CLUSTER_NAME \
  -hostname=aurora.local \
  -http_port=8081 \
  -native_log_quorum_size=1 \
  -zk_endpoints=zookeeper:2181 \
  -mesos_master_address=zk://zookeeper:2181/mesos/master \
  -serverset_path=/aurora/scheduler \
  -native_log_zk_group_path=/aurora/replicated-log \
  -native_log_file_path=/var/db/aurora \
  -backup_dir=/opt/aurora/backup \
  -thermos_executor_path=$DIST_DIR/thermos_executor.pex \
  -thermos_executor_flags="--announcer-enable --announcer-ensemble zookeeper:2181" \
  -allowed_container_types=DOCKER \
  -http_authentication_mechanism=BASIC \
  -use_beta_db_task_store=true \
  -shiro_ini_path=/opt/aurora/shiro.ini \
  -enable_h2_console=true \
  -tier_config=/opt/aurora/tiers.json \
  -receive_revocable_resources=true
