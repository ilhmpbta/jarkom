#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install -y iptables

iptables -A FORWARD -d 10.49.0.0/23 -p tcp -m multiport --dports 1337,4444 -j LOG --log-prefix "PACKET DROPPED: "
iptables -A FORWARD -d 10.49.0.0/23 -p tcp -m multiport --dports 1337,4444 -j DROP