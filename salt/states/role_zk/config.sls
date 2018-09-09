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
      
