# Put anything the saltmaster needs here
engines_dirs:
  - /srv/formulas/dispatchapong-formula/engines
  
engines:
  - dispatchapong:
      alert_mapping:
        ntpq.associations.low_sns: cloudntp.reset_minion_ntp
      aws_region: us-west-2
      it_failed: 'Oh no, that failed :scream:'
      it_worked: 'On your way :+1:'
      log_follow_url: https://papertrailapp.com/groups/SOMEGROUP/events?q=saltmaster
      slack_web_hook: 
      sqs_queue_name: 


git-repos:
  salt-states:
    name: git@github.com:librato/salt-states
    rev: master
    target: /srv/salt
    force_fetch: true
    force_reset: true
  salt-pillar:
    name: git@github.com:librato/salt-pillar.git
    rev: master
    target: /srv/pillar
    force_fetch: true
    force_reset: true
  ntp-formula:
    name: https://github.com/librato/ntp-formula.git
    rev: master
    target: /srv/formulas/ntp-formula
    force_fetch: false
    force_reset: false
  logrotate-formula:
    name: https://github.com/librato/logrotate-formula.git
    rev: master
    target: /srv/formulas/logrotate-formula
    force_fetch: false
    force_reset: false
  aoagent-formula:
    name: git@github.com:librato/aoagent-formula.git
    rev: master
    target: /srv/formulas/aoagent-formula
    force_fetch: true
    force_reset: true
  syslog_ng-formula:
    name: git@github.com:librato/syslog_ng-formula.git
    rev: master
    target: /srv/formulas/syslog_ng-formula
    force_fetch: true
    force_reset: true
  swicloud-zookeeper-formula:
    name: git@github.com:librato/swicloud-zookeeper-formula.git
    rev: master
    target: /srv/formulas/swicloud-zookeeper-formula
    force_fetch: true
    force_reset: true
  dispatchapong-formula:
    name: git@github.com:librato/dispatchapong-formula
    rev: master
    target: /srv/formulas/dispatchapong-formula
    force_fetch: true
    force_reset: true

  
