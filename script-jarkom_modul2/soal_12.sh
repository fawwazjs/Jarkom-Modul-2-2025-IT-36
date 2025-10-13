#admin-sirion.sh
#!/bin/bash
# ===============================
# Basic Auth path /admin
# Sirion (Reverse Proxy)
# ===============================

apt-get update
apt-get install apache2-utils -y

htpasswd -bc /etc/nginx/.htpasswd noiris esteh3000

CONF_FILE="/etc/nginx/sites-available/reverse.K36.com"

# Cek konfigurasi Sirion
if [ ! -f "$CONF_FILE" ]; then
    echo "❌ Konfigurasi $CONF_FILE belum ada! Jalankan setup-sirion.sh dulu."
    exit 1
fi

# Hapus blok lama (kalau ada) & tambah ulang
sed -i '/location \/admin\//,/}/d' "$CONF_FILE"

# Tambah blok auth di akhir file (sebelum tanda '}')
sed -i '/^}/i \
    location /admin/ {\n\
        auth_basic "Restricted Area";\n\
        auth_basic_user_file /etc/nginx/.htpasswd;\n\
        return 200 "<h1>Welcome to Admin Area</h1>";\n\
    }\n' "$CONF_FILE"

# Uji konfigurasi Nginx
nginx -t
if [ $? -eq 0 ]; then
    service nginx restart
    echo "✅ Basic Auth untuk /admin telah diaktifkan!"
    echo "   Username: noiris"
    echo "   Password: esteh3000"
else
    echo "❌ Gagal validasi konfigurasi Nginx!"
fi