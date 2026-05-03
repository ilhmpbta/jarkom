#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install -y iptables

iptables -A FORWARD -d 10.49.2.0/25 -p icmp ! -s 10.49.2.0/25 -j LOG --log-prefix "PACKET DROPPED: "
iptables -A FORWARD -d 10.49.2.0/25 -p icmp ! -s 10.49.2.0/25 -j DROP