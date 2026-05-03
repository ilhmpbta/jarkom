auto eth0
iface eth0 inet static
    address 10.49.41.131
    netmask 255.255.255.192
    gateway 10.49.41.129

up echo nameserver 10.49.41.194 > /etc/resolv.conf
up echo nameserver 10.49.41.195 >> /etc/resolv.conf
up echo nameserver 8.8.8.8 >> /etc/resolv.conf