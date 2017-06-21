remove old firefox:
  cmd.run:
  - name: rm -rf /Applications/Firefox.app/ 

copy new firefox app:
  file.recurse:
  - name: /Applications/Firefox.app/
  - source: salt://salt_repo/Firefox.app/
  - file_mode: 755
  - owner: root
  - group: wheel
