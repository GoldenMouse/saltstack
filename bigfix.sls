####  Installs Bigfix
## 
#

make sure bigfix is running:
  service.running:
{% if grains['os_family'] == 'RedHat' or grains['os_family'] == 'Debian' %}
  - name: besclient
{% elif grains['os_family'] == 'MacOS' %}
  - name: com.bigfix.BESAgent
{% endif %}
  - enable: True

copy bigfix installer:
  file.recurse:
  - name: /root/salt_repo/Bigfix/
{% if grains['os_family'] == 'Redhat' %}
  - source: salt://salt_repo/Bigfix-Redhat
{% elif grains['os_family'] == 'Debian' %}
  - source: salt://salt_repo/Bigfix-Ubuntu
{% elif grains['os_family'] == 'MacOS' %}
  - source: salt://salt_repo/Bigfix-Mac
{% endif %}
  - file_mode: 755
  - onfail:
    - service: make sure bigfix is running

execute bigfix installer:
  cmd.run:
  - name: /root/salt_repo/Bigfix/install.sh
  - cwd: /root/salt_repo/Bigfix/
  - onchanges:
    - file: copy bigfix installer

remove bigfix installer:
  file.absent:
  - name: /root/salt_repo/Bigfix/
  - onchanges:
    - file: copy bigfix installer
