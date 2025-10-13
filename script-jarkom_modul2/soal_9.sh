#setup-lindon.sh
#!/bin/bash
apt-get update
apt-get install nginx -y

mkdir -p /var/www/static.K36.com/annals
echo "Ingfo dari Lindon." > /var/www/static.K36.com/annals/readme.txt

cat > /etc/nginx/sites-available/static.K36.com <<'EOF'
server {
    listen 80;
    server_name static.K36.com;
    root /var/www/static.K36.com;
    index index.html index.htm;

    location /annals/ {
        autoindex on;
        try_files $uri $uri/ =404;
    }

    if ($host != "static.K36.com") {
        return 301 http://static.K36.com$request_uri;
    }
}
EOF

ln -sf /etc/nginx/sites-available/static.K36.com /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t && service nginx restart
service nginx enable