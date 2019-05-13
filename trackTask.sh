#!/bin/bash
set -e
set -u

log (){
    echo $@ >> $log
}

project_names=projects.txt
log=log.log
project=$(cat $project_names | fzf)
echo "Starting..."
while [[ True ]] ;do 
    sleep 60 
    message="$(date +%D_%T) $project"
    echo $message
    log $message
done
