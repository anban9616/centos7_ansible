#!/bin/bash
cd /opt/nginx-1.16.1
make clean
./configure --prefix=/usr/local/nginx \
--pid-path=/run/nginx.pid \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_gzip_static_module \
--user=www \
--group=www
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

