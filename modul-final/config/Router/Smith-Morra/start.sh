#!/bin/sh

ip route add 10.49.40.0/24 via 10.49.41.226
ip route add 10.49.41.0/25 via 10.49.41.226
ip route add 10.49.41.128/26 via 10.49.41.226
ip route add 10.49.41.192/28 via 10.49.41.226
ip route add 10.49.41.208/29 via 10.49.41.226
ip route add 10.49.41.216/29 via 10.49.41.226

apt-get update
apt-get install -y iptables
apt-get install -y ulogd2
service ulogd2 start

# NAT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# FORWARD: drop SSH to 10.49.41.192/28
iptables -A FORWARD -d 10.49.41.192/28 -p tcp --dport 22 \
    -j NFLOG --nflog-prefix "DROP SSH-FWD: " --nflog-group 0
iptables -A FORWARD -d 10.49.41.192/28 -p tcp --dport 22 -j DROP

# DROP INVALID packets
iptables -A INPUT   -m conntrack --ctstate INVALID \
    -j NFLOG --nflog-prefix "DROP INVALID IN: " --nflog-group 0
iptables -A INPUT   -m conntrack --ctstate INVALID -j DROP

iptables -A FORWARD -m conntrack --ctstate INVALID \
    -j NFLOG --nflog-prefix "DROP INVALID FWD: " --nflog-group 0
iptables -A FORWARD -m conntrack --ctstate INVALID -j DROP

iptables -A OUTPUT  -m conntrack --ctstate INVALID \
    -j NFLOG --nflog-prefix "DROP INVALID OUT: " --nflog-group 0
iptables -A OUTPUT  -m conntrack --ctstate INVALID -j DROP


apt-get install -y isc-dhcp-relay

echo 'SERVERS="10.49.41.130 10.49.41.131"
INTERFACES="eth1 eth2 eth3"
OPTIONS=""
' > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf
service isc-dhcp-relay restart