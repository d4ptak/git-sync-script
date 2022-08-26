# Git sync script

The local repository with the script is synchronised with the Git repository according to the configuration of the cron daemon (e.g. every 15 minutes):
```
0/15 * * * * path/to/sync.sh > /dev/null 2>&1
```

