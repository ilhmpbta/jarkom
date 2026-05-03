auto eth0
iface eth0 inet static
    address 10.49.41.210
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.49.41.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 10.49.41.193
    netmask 255.255.255.240

auto eth3
iface eth3 inet static
    address 10.49.40.1
    netmask 255.255.255.0

up echo nameserver 10.49.41.194 > /etc/resolv.conf
up echo nameserver 10.49.41.195 >> /etc/resolv.conf
up echo nameserver 8.8.8.8 >> /etc/resolv.conf