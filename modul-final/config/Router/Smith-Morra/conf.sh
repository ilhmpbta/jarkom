auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.49.41.225
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.49.32.1
    netmask 255.255.248.0

auto eth3
iface eth3 inet static
    address 10.49.0.1
    netmask 255.255.224.0

up echo nameserver 10.49.41.194 > /etc/resolv.conf
up echo nameserver 10.49.41.195 >> /etc/resolv.conf
up echo nameserver 8.8.8.8 >> /etc/resolv.conf