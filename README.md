# Git sync script

The files in the current folder (with the script) are synchronised with the Git repository according to the configuration of the cron daemon (e.g. every 15 minutes):
```
0/15 * * * * path/to/sync.sh > /dev/null 2>&1
```

