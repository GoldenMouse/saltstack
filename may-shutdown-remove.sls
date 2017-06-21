"delete cron":
  cron.absent:
   - name: /sbin/shutdown -h now
