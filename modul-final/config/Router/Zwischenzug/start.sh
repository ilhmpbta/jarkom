#!/bin/sh

ip route add 10.49.0.0/19 via 10.49.41.217
ip route add 10.49.32.0/21 via 10.49.41.217
ip route add 10.49.40.0/24 via 10.49.41.210
ip route add 10.49.41.0/25 via 10.49.41.210
ip route add 10.49.41.128/26 via 10.49.41.219
ip route add 10.49.41.192/28 via 10.49.41.210
ip route add 10.49.41.224/30 via 10.49.41.217
ip route add default via 10.49.41.217

apt-get update
apt-get install -y iptables
apt-get install -y isc-dhcp-relay

echo '
SERVERS="10.49.41.130 10.49.41.131"
INTERFACES="eth0 eth1"
OPTIONS=""
' > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf
service isc-dhcp-relay restart