#setup-sirion.sh
#!/bin/bash
# Reverse Proxy Sirion (K36)
# /static -> Lindon | /app -> Vingilot

apt-get update
apt-get install nginx -y

cat > /etc/nginx/sites-available/reverse.K36.com <<'EOF'
server {
    listen 80;
    server_name www.K36.com sirion.K36.com;

    # Redirect non-www ke www (kanonik)
    if ($host = sirion.K36.com) {
        return 301 http://www.K36.com$request_uri;
    }

    # ==== Proxy ke Lindon (/static) ====
    location /static/ {
        proxy_pass http://192.229.3.103/annals/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    # ==== Proxy ke Vingilot (/app) ====
    location /app/ {
        proxy_pass http://192.229.3.104/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    # ==== Root Default ====
    location / {
        return 200 "<h1>Sirion Reverse Proxy is Running</h1><p>Use /static or /app paths</p>";
        add_header Content-Type text/html;
    }
}
EOF

ln -sf /etc/nginx/sites-available/reverse.K36.com /etc/nginx/sites-enabled/
nginx -t && service nginx restart

echo "✅ Reverse proxy untuk Sirion telah aktif!"
echo "   /static → Lindon (192.229.3.103)"
echo "   /app → Vingilot (192.229.3.104)"
echo "   Akses: http://www.K36.com atau http://sirion.K36.com"