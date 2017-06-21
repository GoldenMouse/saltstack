make sure bigfix is running:
  service.running:
  - name: com.bigfix.BESAgent
  - enable: True

copy bigfix installer:
  file.recurse:
  - name: /root/salt_repo/Bigfix-Mac
  - source: salt://salt_repo/Bigfix-Mac
  - file_mode: 755
  - onfail:
    - service: make sure bigfix is running

execute bigfix installer:
  cmd.run:
  - name: /root/salt_repo/Bigfix-Mac/install.sh
  - cwd: /root/salt_repo/Bigfix-Mac/
  - onchanges:
    - file: copy bigfix installer

remove bigfix installer:
  file.absent:
  - name: /root/salt_repo/Bigfix-Mac/
  - onchanges:
    - file: copy bigfix installer
