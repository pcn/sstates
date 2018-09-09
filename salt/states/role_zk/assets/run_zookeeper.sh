#!/bin/bash
# This file is managed by salt.  Local change will be overwritten

# This is to allow systemd to start zookeeper on a server.

. /etc/zookeeper/conf/environment

$JAVA \
  -Dzookeeper.log.dir=$ZOO_LOG_DIR \
  -Dzookeeper.root.logger=$ZOO_LOG4J_PROP \
  -cp "$CLASSPATH" \
  $JAVA_OPTS \
  -Xlog:gc=info \
  -Dcom.sun.management.jmxremote.port=2191 \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  $ZOOMAIN \
  $ZOOCFG


