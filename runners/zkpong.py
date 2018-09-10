# -*- python -*-

import logging
import sys
import time

import salt.config  # First import config, then log.  That should get us logging config   
import salt.log
import salt.master
import salt.client

log = logging.getLogger(__name__)


def srvr_1(minion_id, slack_webhook_url=None, **kwargs):
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd(minion_id, 'zk.srvr', [])
    return (srvr_result,)


def srvr_2(minion_id, slack_webhook_url=None, **kwargs):
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd('zk*', 'zk.srvr', [])
    return (srvr_result,)

def srvr_3(minion_id, slack_webhook_url=None, **kwargs):
    """In the real world, we would add some paranoia so we don't restart the master"""
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd('zk*', 'zk.srvr', [])
    
    for minion_id, data in sorted(srvr_result.items()):
        # Only act on one node per alert
        if not data['result']:
            # restart zookeeper
            remedy_result = client.cmd(minion_id, 'service.restart', ['zookeeper'])
            salt.utils.http.query(url=slack_webhook_url, method='POST',
                                  data=json.dumps({"text": remedy_result}))
            salt.utils.http.query(url=slack_webhook_url, method='POST',
                                  data=json.dumps({"text": "sleeping for 10 seconds to slow things down"}))
            time.sleep(10)
    srvr_result2 = client.cmd('zk*', 'zk.srvr', [])
    return (srvr_result2,)
    
