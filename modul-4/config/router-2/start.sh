#!/bin/bash

apt-get update
apt-get install -y iptables
iptables -t nat -A POSTROUTING -o eth3 -j MASQUERADE
ip route add default via 192.168.122.1 dev eth3