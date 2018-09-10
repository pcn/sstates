# Put anything the saltmaster needs here

syslog_ng:
  watched_files:
    - filename: /var/log/salt/master
      shortname: master


engines_dirs:
  - /srv/formulas/dispatchapong-formula/engines
  
engines:
  dispatchapong:
    alert_mapping:
      ntpq.associations.low_sns: cloudntp.reset_minion_ntp
    aws_region: us-east-2
    it_failed: "Oh no, that failed :scream:"
    it_worked: "On your way :+1:"
    log_follow_url: https://papertrailapp.com/systems/saltmaster/events
    slack_web_hook: "https://hooks.slack.com/services/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"
    sqs_queue_name: dispatchaping


