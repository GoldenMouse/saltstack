"shutdown system may 24":
  cron.present:
  - name: /sbin/shutdown -h now
  - user: root
  - minute: '0'
  - hour: '5'
  - daymonth: '24'
  - month: '5'
