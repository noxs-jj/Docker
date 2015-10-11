## Base image Ubuntu 14.04
FROM ubuntu:14.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

## Set local for postgresql to suppress bug
RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

## install following packets with auto accept
RUN apt-get update ; apt-get install -y curl nano openssh-server wget nginx transmission-daemon \
		&& apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		&& rm /var/lib/transmission-daemon/info/settings.json \
		&& rm /etc/nginx/sites-enabled/default

RUN adduser webs
RUN mkdir /root/.ssh ; mkdir /home/webs/.ssh
ADD build_file/ssh/ /root/.ssh/
ADD build_file/ssh/ /home/webs/.ssh/

## Set debian-transmission
ADD build_file/debian-transmission/settings.json /var/lib/transmission-daemon/info/

## Set Nginx
ADD build_file/nginx/default /etc/nginx/sites-enabled/

## Expose SSH port & and default http
EXPOSE 22 80 1337 9091 35791

CMD ["/usr/sbin/sshd", "-D"]
