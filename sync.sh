#!/bin/bash

# This script is used by cron daemon to synchronise files to the configured Git repository.

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASENAME=`basename ${PWD}`

echo -e "${GREEN}Sync started at `date +%T`${NC}"

git status | grep "nothing to commit"

if [ $? -eq 0 ]; then
    echo -e "${RED}Sync stopped.${NC}"
    exit 0
fi

git add .
git commit -m "Automatically synced."
git pull
git push

echo -e "${GREEN}Sync completed.${NC}"

# set DBUS_SESSION_BUS_ADDRESS variable available when script is run by cron daemon
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DBUS_SESSION_BUS_ADDRESS

# send a desktop notification
notify-send 'Git Sync' "Folder ${BASENAME} has been synced at `date +%T`"
