FROM ubuntu:14.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN apt-get update ; apt-get install -y \
curl git-core nano wget nginx-extras node-legacy npm \
redis-server webdis \
apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD addfile/webdis/webdis.json /etc/webdis/webdis.json
ADD addfile/nginx/project /etc/nginx/site-enable/

RUN mkdir /var/www ; chmod 777 /var/www

## Expose http port
EXPOSE 80 6379 7379
