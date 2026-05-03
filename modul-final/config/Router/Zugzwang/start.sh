#!/bin/sh

ip route add 10.49.0.0/19 via 10.49.41.209
ip route add 10.49.32.0/21 via 10.49.41.209
ip route add 10.49.41.128/26 via 10.49.41.209
ip route add 10.49.41.216/29 via 10.49.41.209
ip route add 10.49.41.224/30 via 10.49.41.209
ip route add default via 10.49.41.209

apt-get update
apt-get install -y isc-dhcp-relay

echo '
SERVERS="10.49.41.130 10.49.41.131"
INTERFACES="eth0 eth1 eth2 eth3"
OPTIONS=""
' > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf
service isc-dhcp-relay restart