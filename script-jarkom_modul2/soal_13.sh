#!/bin/bash

apt-get update
apt-get install nginx -y

cat > /etc/nginx/sites-available/reverse.K36.com <<'EOF'
# Canonical redirect (sirion -> www)
server {
    listen 80 default_server;
    server_name _;
    return 301 http://www.K36.com$request_uri;
}

server {
    listen 80;
    server_name sirion.K36.com;
    return 301 http://www.K36.com$request_uri;
}

# Main site
server {
    listen 80;
    server_name www.K36.com;

    location /static/ {
        proxy_pass http://192.229.3.103/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /app/ {
        proxy_pass http://192.229.3.104/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /admin/ {
        auth_basic "Restricted Area";
        auth_basic_user_file /etc/nginx/.htpasswd;
        return 200 "<h1>Welcome to Admin Area</h1>";
    }

    location / {
        return 200 "<h1>Sirion Reverse Proxy is Running</h1><p>Use /static or /app paths</p>";
        add_header Content-Type text/html;
    }
}
EOF

rm -f /etc/nginx/sites-enabled/default

ln -sf /etc/nginx/sites-available/reverse.K36.com /etc/nginx/sites-enabled/
nginx -t && service nginx restart