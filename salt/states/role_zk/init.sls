# Install packages

zookeeper:
  pkg.installed


/opt/appoptics/etc/plugins.d/zookeeper.yaml:
  file.managed:
    - mode: 0444
    - user: root
    - group: root
    - contents_pillar: "appoptics:configured_plugins:zookeeper"

