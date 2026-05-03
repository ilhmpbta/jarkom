auto eth0
iface eth0 inet static
    address 10.49.41.194
    netmask 255.255.255.240
    gateway 10.49.41.193

up echo nameserver 10.49.41.194 > /etc/resolv.conf
up echo nameserver 10.49.41.195 >> /etc/resolv.conf
up echo nameserver 8.8.8.8 >> /etc/resolv.conf