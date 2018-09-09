#!/bin/bash
# This file is managed by salt.  Local change will be overwritten

# This is to allow systemd to start zookeeper on a server.

. /etc/zookeeper/conf/environment

$JAVA \
  -ea \
  -cp $CLASSPATH \
  $JAVA_OPTS \
  -Xloggc:/var/log/zookeeper/gc.log \
  -XX:+UseGCLogFileRotation \
  -XX:NumberOfGCLogFiles=3 \
  -XX:GCLogFileSize=10M \
  -Dcom.sun.management.jmxremote.port=2191 \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  $ZOOMAIN \
  $ZOOCFG
