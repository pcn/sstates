include:
  - role_salt_master.engines

/srv/salt:
  file.symlink:
    - target: /home/ubuntu/sstates/salt/states


/srv/pillar:
  file.symlink:
    - target: /home/ubuntu/sstates/salt/pillar


/srv/formulas:
  file.symlink:
    - target: /home/ubuntu/sstates/formulas

/srv/modules:
  file.symlink:
    - target: /home/ubuntu/sstates/modules


python-boto3:
  pkg.installed

