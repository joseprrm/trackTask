#!/bin/bash
set -e
set -u

log=log.log

cat projects.txt |
while read line ; do
    minutes=$(cat $log|grep "$line" |wc -l)
    hours=$(echo "scale=2;" $minutes "/60" |bc -l)
    # I guess we could not multipy minutes by 60 and use %M:%s, but I think it's better this way
    ### hours_minutes=$(date -d@$minutes -u +%M:%S )###
    hours_minutes=$(date -d@$(( $minutes * 60 )) -u +%H:%M )
    echo -e $line "," $minutes "," $hours "," $hours_minutes "\n"
done |column -t -s ','
