### Uninstalls and reinstalls Retrospect

copy working files:
  file.recurse:
  - name: /root/salt_repo/Retrospect_Client_MAC-10.5.0
  - source: salt://salt_repo/Retrospect_Client_MAC-10.5.0
  - file_mode: 755

execute uninstaller:
  cmd.script:
  - name: Retrospect_Client_Uninstall.sh
  - source: salt://salt_repo/Retrospect_Client_MAC-10.5.0/Retrospect_Client_Uninstall.sh

set the state file which is the access password:
  file.managed: 
  - name: /Library/Preferences/retroclient.state
  - source:  salt://salt_repo/Retrospect_Client_MAC-10.5.0/retroclient.state
  - mode: 644

install client:
  cmd.run:
  - name: installer -pkg Retrospect_Client_Installer.pkg -target /
  - cwd: /root/salt_repo/Retrospect_Client_MAC-10.5.0/

turn on the client:
  cmd.run:
  - name: launchctl load -w /Library/LaunchDaemons/com.retrospect.retroclient.plist; pkill -9 retroclient

remove working files:
  file.absent:
  - name: /root/salt_repo/Retrospect_Client_MAC-10.5.0/
