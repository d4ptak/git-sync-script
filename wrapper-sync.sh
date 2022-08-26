#!/bin/bash

FILE='../repositories_to_sync.txt'

if [ ! -f "$FILE" ]; then 
  echo "File $FILE does not exist!"
  exit 0
fi

while read REPO; do
   if [ -d "$REPO" ]; then
     cd $REPO
     if [ ! -f sync.sh ]; then
	ln -s ../git-sync-script/sync.sh sync.sh
     fi	
     ./sync.sh
   fi
done < $FILE

exit 0
