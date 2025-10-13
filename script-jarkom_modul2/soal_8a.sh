#!/bin/bash

apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

cat >> /etc/bind/named.conf.local <<'EOF'

zone "3.229.192.in-addr.arpa" {
        type master;
        file "/etc/bind/ns1/3.229.192.in-addr.arpa";
        allow-transfer { 192.229.3.102; };
        also-notify { 192.229.3.102; };
        notify yes;
};
EOF

cat > /etc/bind/ns1/3.229.192.in-addr.arpa <<'EOF'
$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     ns1.K36.com. root.K36.com. (
                        2025100401 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      ns1.K36.com.
@       IN      NS      ns2.K36.com.

100     IN      PTR     sirion.K36.com.
103     IN      PTR     lindon.K36.com.
104     IN      PTR     vingilot.K36.com.
EOF

service bind9 restart