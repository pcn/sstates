import json
import socket

def _sendsrvr():
    s = socket.socket(socket.AF_INET)
    s.connect(('localhost', 2181,))
    s.send('srvr')
    retdata = s.recv(1024)
    s.close()
    return retdata

def srvr(zkminions="zk*", full=False):
    """Returns the output of the zookeeper "srvr" command.

    The default is to filter out everything except leader/follower data
    and version to remove runtime variances so this could be used with
    survey.hash.

    Using full=true returns all data.

    Preferred usage:

    ubuntu@saltmaster-3-stagevpc:/srv/salt$ sudo salt-run survey.hash 'zk*' zk.srvr
    |_
      ----------
      pool:
          - zksvcs-1-stagevpc
          - zksvcs-2-stagevpc
          - zksvcs-3-stagevpc
          - zksvcs-4-stagevpc
      result:
          Zookeeper version: 3.3.6-1366786, built on 07/29/2012 06:22 GMT
          Mode: follower
    |_
      ----------
      pool:
          - zkfull-1-stagevpc
          - zkfull-3-stagevpc
          - zkfull-4-stagevpc
          - zkfull-5-stagevpc
      result:
          Zookeeper version: 3.4.8--1, built on 02/06/2016 03:18 GMT
          Mode: follower
    |_
      ----------
      pool:
          - zksvcs-5-stagevpc
      result:
          Zookeeper version: 3.3.6-1366786, built on 07/29/2012 06:22 GMT
          Mode: leader
    |_
      ----------
      pool:
          - zkfull-2-stagevpc
      result:
          Zookeeper version: 3.4.8--1, built on 02/06/2016 03:18 GMT
          Mode: leader


    """
    # cmdrun = __salt__['cmd.run']

    # cmd = """echo srvr | nc 127.0.0.1 2181; echo srvr | nc 127.0.0.1 2181; """

    # result = cmdrun(cmd, python_shell=True)

    try:
        result = _sendsrvr()
    except socket.error, se:
        return "Socket error: {}".format(str(se))
    
    if full:
        return result
    return "\n".join([z for z in result.split("\n") if 'Zoo' in z or 'Mode' in z])
