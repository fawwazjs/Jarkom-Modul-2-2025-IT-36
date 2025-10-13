#!/bin/bash

apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

cat > /etc/bind/named.conf.local <<'EOF'
zone "K36.com" {
        type master;
        file "/etc/bind/ns1/K36.com";
        allow-transfer { 192.229.3.102; };
        also-notify { 192.229.3.102; };
        notify yes;
};
EOF

mkdir -p /etc/bind/ns1
chown bind:bind /etc/bind/ns1

cat > /etc/bind/zone.template <<'EOF'
$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     localhost. root.localhost. (
                        2025100401 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      localhost.
@       IN      A       127.0.0.1
EOF

cp /etc/bind/zone.template /etc/bind/ns1/K36.com

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
EOF

cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    dnssec-validation no;
    listen-on-v6 { any; };
    allow-query { any; };
    auth-nxdomain no;
};
EOF

service bind9 restart

