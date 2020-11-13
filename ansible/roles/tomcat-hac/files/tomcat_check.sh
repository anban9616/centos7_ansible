#!/bin/bash
count=1

while true
do
	#grep apache-tomcat 而不是 grep tomcat,因为脚本名称包含tomcat
    ps aux | grep apache-tomcat | grep -v grep >/dev/null 2>&1
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
