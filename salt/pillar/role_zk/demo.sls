zk_servers:
  zk-1:
    "myid": 1
    "ip": "192.168.122.11"
  zk-2:
    "myid": 2
    "ip": "192.168.122.12"
  zk-3:
    "myid": 3
    "ip": "192.168.122.13"


    
{% set servers = {
  "zk-1" : {
    "myid" : 1,
    "ip" : "192.168.122.11"
  },
  "zk-2": {
    "myid": 2,
    "ip" : "192.168.122.12"
  },
  "zk-3": {
    "myid": 3,
    "ip" : "192.168.122.13"
  }
}
-%}


# test with while true; do zkCli.sh -server localhost:2181  set /foopath "$(date +%s)"; sleep 1; done
{% set data_dir = "/zookeeper" %}
{% set version = "3.4.10" %}
{% set client_port = "2181" %}

zookeeper:
  version: {{ version }}
  package: librato-zookeeper-{{ version }}
  dir: /opt/zookeeper-{{ version }}
  servers:
    {{ servers | yaml }}
  data_dir: {{ data_dir }}/zookeeper
  lookup:
    heap_mx: 2048m
    heap_ms: 2048m
    config:
      initLimit: 10
      syncLimit: 5
      clientPort: {{ client_port }}
      tickTime: 2000
      dataDir: {{ data_dir }}/zookeeper
      dataLogDir: {{ data_dir }}/zookeeper
      maxClientCnxns: 100
      autopurge.snapRetainCount: 5
      autopurge.purgeInterval: 2
      leaderServes: "yes"

zoo_cfg_ids:
  {{ servers | yaml }}

zoo_cfg_ports:
{% for k,v in servers.items() %}
  - {{ v['ip'] ~ ":" ~ (client_port|string) }}
{% endfor -%}

zookeeper_client_port: {{ client_port }}

syslog_ng:
  watched_files:
    - filename: /var/log/zookeeper/zookeeper.log
      shortname: zookeeper
    - filename: /var/log/zookeeper/gc.log
      shortname: gc

appoptics:
  configured_plugins:
    zookeeper:
      collector:
        zookeeper:
          all:
            ## An array of address to gather stats about. Specify an ip or hostname
            ## with port. ie localhost:2181, 10.0.0.1:2181, etc.
            ## If no servers are specified, then localhost is used as the host.
            ## If no port is specified, 2181 is used
            # servers: "10.0.0.1:2181,10.0.0.2:2181,10.0.0.3:2181"
            # servers: ":2181"
            grpc_timeout: 30
      load:
        plugin: snap-plugin-collector-bridge-zookeeper
        task: task-bridge-zookeeper.yaml
