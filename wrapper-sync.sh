#!/bin/bash

FILE='../names_to_sync.txt'

while read NAME; do
   if [ -d "$NAME" ]; then
     cd $NAME
     ./sync.sh
   fi
done < $FILE

exit 0
