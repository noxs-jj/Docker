docker run \
-i -t \
-h "DOCK-nginx-webdis" \
-p 80:80 \
-p 6379:6379 \
-p 7379:7379 \
-v /home/noxsnono/xxxx:/var/www \
noxsnono/nginx_webdis:v00001 \
bash
