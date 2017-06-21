####  Config syslog daemon to foward logs to the centra logging server
## 
#

copy syslog.conf :
  file.managed:
{% if grains['os_family'] == 'RedHat' or grains['os_family'] == 'Debian' %}
  - name: /etc/rsyslog.conf
  - source: salt://salt_repo/syslog/rsyslog.conf
{% elif grains['os_family'] == 'MacOS' %}
  - name: /etc/syslog.conf
  - source: salt://salt_repo/syslog/syslog.conf
{% endif %}

restart syslog daemon:
{% if grains['os_family'] == 'RedHat' or grains['os_family'] == 'Debian' %}
  module.run:
  - name: service.restart
  - m_name: rsyslog
#- watch:
#  - file: copy syslog.conf
{% elif grains['os_family'] == 'MacOS' %}
  cmd.run:
  - name: pkill -9 syslogd
  - onchanges:
    - file: copy syslog.conf
{% endif %}
