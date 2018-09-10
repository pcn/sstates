/etc/salt/master.d/engines.conf:
  file.managed:
    - template: jinja
    - source: salt:///role_salt_master/templates/engines.conf.j2