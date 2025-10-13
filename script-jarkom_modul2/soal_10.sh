#setup-vingilot.sh
#!/bin/bash
# setup-vingilot.sh — Web dinamis PHP-FPM di hostname app.K36.com

apt-get update -y
apt-get install -y nginx php8.4-fpm

mkdir -p /var/www/app.K36.com

cat > /var/www/app.K36.com/index.php <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Vingilot - Home</title>
</head>
<body>
    <h1>Selamat datang di Vingilot</h1>
    <p>Ini adalah halaman utama dari web dinamis kelompok K36.</p>
    <a href="/about">Tentang Kami</a>
</body>
</html>
EOF

cat > /var/www/app.K36.com/about.php <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>About - Vingilot</title>
</head>
<body>
    <h1>Tentang Vingilot</h1>
    <p>Ini adalah halaman about dari web dinamis Vingilot.</p>
    <a href="/">Kembali ke Beranda</a>
</body>
</html>
EOF

cat > /etc/nginx/sites-available/app.K36.com <<'EOF'
server {
    listen 80;
    server_name app.K36.com;

    root /var/www/app.K36.com;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location /about {
        rewrite ^/about$ /about.php last;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

ln -sf /etc/nginx/sites-available/app.K36.com /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t && service nginx restart && service php8.4-fpm restart