#!/bin/bash

apt-get update
apt-get install bind9 -y

ln -s /etc/init.d/named /etc/init.d/bind9

cat > /etc/bind/named.conf.local <<'EOF'
zone "K36.com" {
        type slave;
        masters { 192.229.3.101; };
        file "/etc/bind/ns1/K36.com";
};
EOF

mkdir -p /etc/bind/ns1
chown bind:bind /etc/bind/ns1

service bind9 restart
