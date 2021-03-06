# -*- python -*-

import json
import logging
import sys
import time

import salt.config  # First import config, then log.  That should get us logging config   
import salt.log
import salt.master
import salt.client

log = logging.getLogger(__name__)


# XXX FIX THIS SO IT FAILS SINCE IT QUERIES THE LEADER
def srvr_1(minion_id, slack_webhook_url=None, **kwargs):
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd(minion_id, 'zk.srvr', [])
    return (srvr_result,)

# XXX FIX THIS SO IT FAILS SINCE IT'S PASSING
def srvr_2(minion_id, slack_webhook_url=None, **kwargs):
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd('zk*', 'zk.srvr', [])
    log.warn("srvr_2: result is {}".format(srvr_result))
    return (srvr_result,)



def srvr_3(minion_id, slack_webhook_url=None, **kwargs):
    """In the real world, we would add some paranoia so we don't restart the leader"""
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd('zk*', 'zk.srvr', [])
    
    for minion_id, data in sorted(srvr_result.items()):
        if not data['result']:
            # restart zookeeper
            remedy_result = client.cmd(minion_id, 'service.restart', ['zookeeper'])
            slackres = salt.utils.http.query(
                url=slack_webhook_url, method='POST', data=json.dumps({"text": "Restarted zookeeper - result is `{}`".format(str(remedy_result))}))
            log.info("Sending a message to slack, result is: {}".format(slackres))
            slackres = salt.utils.http.query(
                url=slack_webhook_url, method='POST', data=json.dumps({"text": "After remediating, sleeping for 10 seconds"}))
            log.info("Sending a message to slack, result is: {}".format(slackres))
            time.sleep(10)
            break  # Only act on one node per alert
    srvr_result2 = client.cmd('zk*', 'zk.srvr', [])
    return (srvr_result2,)
    
