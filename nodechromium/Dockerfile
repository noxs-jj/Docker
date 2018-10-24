FROM node:10.8.0-alpine

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

USER node
RUN npm install -g @angular/cli@7.0.2

USER root

# install chromium for headless browser tests
ENV CHROME_BIN=/usr/bin/chromium-browser
RUN apk add --no-cache chromium udev ttf-freefont
