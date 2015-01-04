boot2docker ssh \
"docker run -d -P \
-v /home/docker/data/ubuntu1/_exchange:/_exchange \
-v /home/docker/data/ubuntu1/home/webs:/home/webs \
-v /home/docker/data/ubuntu1/postgres_db:/postgres_db \
-v /home/docker/data/ubuntu1/var_www:/var/www \
-h="DOCKER--" \
noxsnono/base:v000001"


echo -n "Physical server: " ; \
docker ps | awk -F " " '{print $1, $2, $12, $13, $14, $15, $16, $17, $18}'

#-v /home/docker/data/ubuntu1/var_log:/var/log \