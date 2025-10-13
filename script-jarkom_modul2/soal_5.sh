#!/bin/bash

apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

cat > /etc/bind/ns1/K36.com <<'EOF'
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

ns1        IN      A       192.229.3.101  ; IP Tirion
ns2        IN      A       192.229.3.102  ; IP Valmar
@          IN      A       192.229.3.100  ; IP Sirion
eonwe      IN      A       192.229.1.1
earendil   IN      A       192.229.1.100
elwing     IN      A       192.229.1.101
cirdan     IN      A       192.229.2.100
elrond     IN      A       192.229.2.101
maglor     IN      A       192.229.2.102
sirion     IN      A       192.229.3.100
lindon     IN      A       192.229.3.103
vingilot   IN      A       192.229.3.104
EOF

service bind9 restart