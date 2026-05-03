#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install -y iptables

iptables -A FORWARD -d 10.49.2.224/28 -p tcp -m multiport --dports 80,443 -m time --timestart 07:00 --timestop 22:00 --weekdays Mon,Tue,Wed,Thu,Fri,Sat -j ACCEPT
iptables -A FORWARD -d 10.49.2.192/27 -p tcp -m multiport --dports 80,443 -m time --timestart 07:00 --timestop 22:00 --weekdays Mon,Tue,Wed,Thu,Fri,Sat -j ACCEPT

iptables -A FORWARD -j LOG --log-prefix "PACKET DROPPED: "

iptables -A FORWARD -d 10.49.2.224/28 -j DROP
iptables -A FORWARD -d 10.49.2.192/27 -j DROP