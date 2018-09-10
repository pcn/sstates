# -*- python -*-                                                                          

import logging
import sys
import time

import salt.config  # First import config, then log.  That should get us logging config   
import salt.log
import salt.master
import salt.client

log = logging.getLogger(__name__)


def srvr(minion_id, slack_webhook_url=None, **kwargs):
    client = salt.client.LocalClient()
    logging.info("Showing zk srvr status")
    srvr_result = client.cmd(minion_id, 'zk.srvr', [])
    return srvr_result
