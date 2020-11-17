#!/bin/bash
count=1

while true
do
    j=$(pgrep nginx -a | grep -v pgrep | grep -v $0 | wc -l)
    #至少存在一个工作进程和一个主进程,但是要去掉命令自身和脚本自身
    if [ $j -ge 2 ] ;then
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
