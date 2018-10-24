FROM node:10.12.0-jessie

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

USER root

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
	apt-key add - && echo deb http://dl.google.com/linux/chrome/deb/ \
	stable main > /etc/apt/sources.list.d/google.list && \
	apt-get update && apt-get install -y dbus-x11 google-chrome-stable

USER node
