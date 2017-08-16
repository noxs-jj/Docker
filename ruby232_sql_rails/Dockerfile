# Nginx PostgreSQL RVM-Ruby 2.3.2

FROM ubuntu:16.04

MAINTAINER Jean-Jacques MOIROUX <jjmoiroux@gmail.com>

ENV RUBY_VERSION 2.3.2

RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale \
    && apt-get install -y autoconf automake bison \
        build-essential curl gawk git-core imagemagick libffi-dev libgdbm-dev \
        libncurses5-dev libpq-dev libreadline6 libreadline6-dev libsqlite3-dev \
        libssl-dev libtool libyaml-dev make nano nginx nodejs openssh-server \
        openssl pkg-config postgresql postgresql-contrib sqlite3 wget zlib1g \
        zlib1g-dev \
    && /bin/bash -l -c  "command curl -sSL https://rvm.io/mpapis.asc | gpg --import -" \
    && \curl -sSL https://get.rvm.io | bash -s stable \
    && /bin/bash -l -c "rvm requirements" \
    && /bin/bash -l -c "rvm install $RUBY_VERSION" \
    && /bin/bash -l -c "rvm use $RUBY_VERSION --default" \
    && /bin/bash -l -c "gem install bundler --no-ri --no-rdoc" \
    && /bin/bash -l -c "rvm use 2.3.2 --default" \
    && apt-get clean ; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
    && chmod 777 "$GEM_HOME" "$BUNDLE_BIN" \
    && echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile \
    && echo "rvm --default use $RUBY_VERSION" >> /etc/profile \
    && echo "source /usr/local/rvm/scripts/rvm" >> /etc/bash.bashrc \
    && echo "rvm --default use $RUBY_VERSION" >> /etc/bash.bashrc \
    && echo "export GEM_HOME=/usr/local/bundle" >> /etc/profile \
    && echo "export BUNDLE_PATH=\$GEM_HOME" >> /etc/profile \
    && echo "export BUNDLE_BIN=\$GEM_HOME/bin" >> /etc/profile \
    && echo "export BUNDLE_SILENCE_ROOT_WARNING=1" >> /etc/profile \
    && echo "export BUNDLE_APP_CONFIG=\$GEM_HOME" >> /etc/profile \
    && echo "export PATH=$BUNDLE_BIN:\$PATH" >> /etc/profile \
    && echo "export GEM_HOME=/usr/local/bundle" >> /etc/bash.bashrc \
    && echo "export BUNDLE_PATH=\$GEM_HOME" >> /etc/bash.bashrc \
    && echo "export BUNDLE_BIN=\$GEM_HOME/bin" >> /etc/bash.bashrc \
    && echo "export BUNDLE_SILENCE_ROOT_WARNING=1" >> /etc/bash.bashrc \
    && echo "export BUNDLE_APP_CONFIG=\$GEM_HOME" >> /etc/bash.bashrc \
    && echo "export PATH=$BUNDLE_BIN:\$PATH" >> /etc/bash.bashrc

RUN adduser webs \
    && mkdir /app && chown -R webs:webs /app ; chown -R webs:webs /etc/nginx/sites-enabled \
    && mkdir /var/run/sshd ; rm -rf /etc/ssh/sshd_config ; rm -rf /etc/sudoers

ADD build_file/sshd_config /etc/ssh/
ADD build_file/sudoers /etc/
ADD build_file/start.sh /
RUN chmod +x /start.sh

VOLUME /app

EXPOSE 22 80 3000 8080 8081 8082 8083

#CMD ["/usr/sbin/sshd", "-D"]
CMD ["/start.sh"]
