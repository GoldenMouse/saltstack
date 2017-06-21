copy bigfix installer:
  file.recurse:
  - name: /root/salt_repo/Bigfix-Ubuntu
  - source: salt://salt_repo/Bigfix-Ubuntu
  - file_mode: 755

execute bigfix installer:
  cmd.run:
  - name: /root/salt_repo/Bigfix-Ubuntu/install.sh
  - cwd: /root/salt_repo/Bigfix-Ubuntu/

remove bigfix installer:
  file.absent:
  - name: /root/salt_repo/Bigfix-Ubuntu/
