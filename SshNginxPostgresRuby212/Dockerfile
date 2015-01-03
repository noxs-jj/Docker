## nectify/base:latest

## base image Ubuntu 14.04
FROM ubuntu:14.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

## Set local for postgresql to suppress bug
RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

## install following packets with auto accept
RUN apt-get update ; apt-get install -y autoconf automake bison build-essential curl gawk git-core imagemagick libffi-dev libgdbm-dev libncurses5-dev libpq-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libtool libyaml-dev make nano nginx nodejs openssh-server openssl pkg-config postgresql postgresql-contrib sqlite3 wget zlib1g zlib1g-dev

## install RVM && ruby 2.1.2
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.2"
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "rvm use 2.1.2 --default"

## Add user webs
RUN adduser webs

# Clean up APT when done.
RUN apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Config SSH server to accept ssh-key for 'root' 'webs'
## for new client add in build_file/authorized_keys
RUN mkdir /root/.ssh ; mkdir /home/webs/.ssh
ADD build_file/ssh/ /root/.ssh/
ADD build_file/ssh/ /home/webs/.ssh/

## Create dir /var/www and take access to 'webs' user
RUN mkdir /var/www && chown -R webs:webs /var/www ; chown -R webs:webs /etc/nginx/sites-enabled

## config 'webs' to be sudo and dont ask password each action
RUN mkdir /var/run/sshd ; rm -rf /etc/ssh/sshd_config ; rm -rf /etc/sudoers
ADD build_file/sshd_config /etc/ssh/
ADD build_file/sudoers /etc/

## Expose SSH port & and default http
EXPOSE 22 80 3000 8080 8081 8082 8083 #### Add other port for expose

CMD ["/usr/sbin/sshd", "-D"]
