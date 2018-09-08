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


