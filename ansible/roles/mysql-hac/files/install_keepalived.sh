#!/bin/bash
cd /opt/keepalived-1.4.5
make clean
./configure --prefix=/usr/local/keepalived
if [[ $? -gt 0 ]];then
	echo "configure error!" >install.log
else
	echo "configure success!" >install.log
fi
make
if [[ $? -gt 0 ]];then
	echo "make error!" >>install.log
else
	echo "make success!" >>install.log
fi
make install
if [[ $? -gt 0 ]];then
	echo "install error!" >>install.log
else
	echo "install success!" >>install.log
fi
cp /usr/local/keepalived/etc/sysconfig/keepalived /etc/sysconfig/
cp -r /usr/local/keepalived/etc/keepalived /etc/

