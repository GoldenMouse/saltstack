make sure bigfix is running:
  service.running:
  - name: besclient
  - enable: True

copy bigfix installer:
  file.recurse:
  - name: /root/salt_repo/Bigfix-Redhat
  - source: salt://salt_repo/Bigfix-Redhat
  - file_mode: 755

execute bigfix installer:
  cmd.run:
  - name: /root/salt_repo/Bigfix-Redhat/install.sh
  - cwd: /root/salt_repo/Bigfix-Redhat/

remove bigfix installer:
  file.absent:
  - name: /root/salt_repo/Bigfix-Redhat/
