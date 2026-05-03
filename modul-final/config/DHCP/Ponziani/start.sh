#!/bin/sh

apt-get update
apt-get install -y isc-dhcp-server
echo 'INTERFACESv4="eth0"
' > /etc/default/isc-dhcp-server

cat /myscripts/dhcpd.conf > /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
