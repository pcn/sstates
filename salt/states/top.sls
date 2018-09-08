base:
  '*':
    - match: compound
    - universal
  'G@id:saltmaster':
    - match: compound
    - role_salt_master
  'G@id:zk*':
    - match: compound
    - role_zk
  
