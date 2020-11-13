#!/bin/bash
count=1

while true
do
    ps aux | grep mysqld | grep -v grep >/dev/null 2>&1
    if [ $? -eq 0 ] ;then
        exit 0
    elif [ $count -gt 3 ] ;then
        break
    else
        let count++
        sleep 2
        continue
    fi
done

systemctl stop keepalived
