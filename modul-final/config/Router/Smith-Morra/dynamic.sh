#!/bin/sh

ip route del 10.49.40.0/24
ip route del 10.49.41.0/25
ip route del 10.49.41.128/26
ip route del 10.49.41.192/28
ip route del 10.49.41.208/29
ip route del 10.49.41.216/29

cd /usr/lib/frr
./zebra -d
./ripd -d
./mgmtd -d
vtysh -c "conf t
router rip
network 10.49.41.224/30
network 10.49.32.0/21
network 10.49.0.0/19
default-information originate
exit
exit"