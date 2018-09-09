# Configure zookeeper
/etc/zookeeper/salt-conf:
  file.directory:
    - user: root
    - group: root
    - mode: 0755

/etc/zookeeper/salt-conf/myid:
  file.managed:
    - template: jinja
    - source: salt:///role_zk/templates/myid.conf.j2
    - user: root
    - group: root
    - mode: 0444


/etc/zookeeper/salt-conf/zoo.cfg:
  file.managed:
    - template: jinja
    - source: salt:///role_zk/templates/zoo.cfg.j2
    - user: root
    - group: root
    - mode: 0444

/etc/zookeeper/salt-conf/environment:
  file.managed:
    - template: jinja
    - source: salt:///role_zk/templates/environment.j2
    - user: root
    - group: root
    - mode: 0444

/etc/zookeeper/salt-conf/log4j.properties:
  file.managed:
    - template: jinja
    - source: salt:///role_zk/templates/log4j.properties.j2
    - user: root
    - group: root
    - mode: 0444


/etc/zookeeper/salt-conf/configuration.xsl:
  file.managed:
    - source: salt:///role_zk/assets/configuration.xsl
    - user: root
    - group: root
    - mode: 0444


/etc/zookeeper/conf:
  alternatives.install:
    - name: zk-salt-conf
    - link: /etc/alternatives/zookeeper-conf
    - path: /etc/zookeeper/salt-conf
    - priority: 1001


/usr/local/bin/run_zookeeper.sh:
  file.managed:
    - source: salt://role_zk/assets/run_zookeeper.sh
    - user: root
    - group: root
    - mode: 0555
    - failhard: True

/etc/systemd/system/zookeeper.service:
  file.managed:
    - source: salt://role_zk/assets/zookeeper.service
    - mode: 0444
    - user: root
    - group: root
    - failhard: True

/opt/appoptics/etc/plugins.d/zookeeper.yaml
  file.managed:
    - mode: 0444
    - user: root
    - group: root
    - contents_pillar: "appoptics:configured_plugins:zookeeper"

/opt/appoptics/etc/tasks.d/zookeeper.yaml
  file.managed:
    - mode: 0444
    - user: root
    - group: root
    - contents_pillar: "appoptics:configured_plugins:zookeeper"
    