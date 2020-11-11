#!/bin/bash
count=1

while true
do
    ps aux | grep mysqld | grep -v grep >/dev/null 2>&1
    j=$?
    if [ $j = 0 ] ;then
        exit 0
    elif [ $count -gt 3 ] ;then
        break
    else
        let count++
        sleep 3
        continue
    fi
done

systemctl stop keepalived
