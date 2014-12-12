FROM ubuntu:14.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN apt-get update ; apt-get install -y curl git-core nano apache2

# Clean up APT when done.
RUN apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/www ; chmod 777 /var/www

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www

## Expose http port
EXPOSE 80
