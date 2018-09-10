# Put anything the saltmaster needs here

syslog_ng:
  watched_files:
    - filename: /var/log/salt/master
      shortname: master


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


