## Base image Ubuntu 14.04
FROM ubuntu:14.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

## Set local for postgresql to suppress bug
RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

## install following packets with auto accept
RUN apt-get update ; apt-get install -y curl nano openssh-server wget nginx \
	transmission-daemon \
			&& apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser webs
RUN mkdir /root/.ssh ; mkdir /home/webs/.ssh
ADD build_file/ssh/ /root/.ssh/
ADD build_file/ssh/ /home/webs/.ssh/

## Set Nginx
RUN rm /etc/nginx/sites-enabled/default
ADD build_file/nginx/default /etc/nginx/sites-enabled

## Set debian-transmission
RUN rm /var/lib/transmission-daemon/info/settings.json
ADD build_file/debian-transmission/settings.json /var/lib/transmission-daemon/info/

## Expose SSH port & and default http
EXPOSE 22 80 3000 8080 8081 8082 8083 9091

CMD ["/usr/sbin/sshd", "-D"]
