# Something something here

appoptics:
  email: "something"
  repo_url: 'https://packagecloud.io/AppOptics'
  repo_base: 'appoptics-snap'
  version: '2.0.0-ao1.1849'
  config_base: '/opt/appoptics/etc'
  plugin_config_path: '/opt/appoptics/etc/plugins.d'
  task_config_path: '/opt/appoptics/etc/tasks.d'
  fqdn_lookup: true
  interval: 60

  logging:
    use_log_file: true
    log_file:
      log_level: '3'
      filename: '/var/log/appoptics/snapteld.log'
      timestamp: true
      print_severity: false


