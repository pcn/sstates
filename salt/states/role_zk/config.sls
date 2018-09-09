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
    - name: zk_config
    - link: /etc/alternatives/zookeeper-conf
    - path: /etc/zookeeper/salt-conf
    - priority: 1000