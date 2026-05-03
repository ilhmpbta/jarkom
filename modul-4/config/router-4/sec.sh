iptables -F FORWARD

iptables -A FORWARD -d 10.49.2.128/27 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 10.49.2.160/27 -p tcp --dport 80 -j ACCEPT

iptables -A FORWARD -j LOG --log-prefix "PACKET DROPPED: "

iptables -A FORWARD -d 10.49.2.128/27 -j DROP
iptables -A FORWARD -d 10.49.2.160/27 -j DROP