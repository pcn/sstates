syslog-ng:
 pkg.installed


/etc/syslog-ng/cert.d:
  file.directory:
    - user: root
    - group: root
    - mode: 0755

curl https://papertrailapp.com/tools/papertrail-bundle.tar.gz | tar xzf -:
  cmd.run:
    - cwd: /etc/syslog-ng/cert.d
    - unless: [ $(ls /etc/syslog-ng/cert.d | wc -l) -gt 0 ]

/etc/syslog-ng/conf.d/papertrail_dest.conf:
  file.managed:
    - source: salt://universal/templates/papertrail_dest.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 0444
    - syslog_ng_destination: {{ salt['pillar.get']('syslog_ng:destination') }}
    - syslog_ng_port: {{ salt['pillar.get']('syslog_ng:port') }}

/etc/syslog-ng/conf.d/papertrail_log.conf:
  file.managed:
    - source: salt://universal/assets/papertrail_log.conf
    - user: root
    - group: root
    - mode: 0444

/etc/syslog-ng/conf.d/app_logs.conf:
  file.managed:
    - source: salt://universal/templates/app_logs.conf.j2
    - user: root
    - group: root
    - mode: 0444
    - template: jinja