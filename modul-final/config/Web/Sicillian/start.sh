#!/bin/sh

apt-get update
apt-get install iptables -y

iptables -A INPUT -p tcp --dport 80 -m time --weekdays Mon,Tue,Wed,Thu,Fri -m time --timestart 09:00 --timestop 17:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP

nginx -c /myscripts/web/nginx.conf -g 'daemon off;'