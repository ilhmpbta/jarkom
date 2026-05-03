#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install -y iptables

# izinkan akses SSH dari subnet IT-PC
iptables -A FORWARD -s 10.49.2.0/25 -d 10.49.2.128/27 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -s 10.49.2.0/25 -d 10.49.2.160/27 -p tcp --dport 22 -j ACCEPT

iptables -A FORWARD -d 10.49.2.128/27 -j DROP
iptables -A FORWARD -d 10.49.2.160/27 -j DROP