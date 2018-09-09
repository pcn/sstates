base:
  '*':
    - match: compound
    - tokens
    - universal
  'G@id:saltmaster':
    - match: compound
    - role_salt_master.demo
  'G@id:zk*':
    - match: compound
    - role_zk.demo
