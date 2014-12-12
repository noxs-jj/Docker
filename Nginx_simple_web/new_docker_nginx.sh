docker run \
-i -t \
-h "DOCK-nginx" \
-p 80:80 \
-v /home/noxsnono/xxxx:/var/www \
noxsnono/nginx_ubuntu:v00001 \
bash
