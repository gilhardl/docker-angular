ARG NODE_VERSION=10.15
FROM node:$NODE_VERSION-alpine

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="1.0.0"
LABEL description="Docker image for Angular development"

ARG APP_DIR="/app"

# Linux setup
RUN apk update \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

# Yarn
RUN apk add yarn

# Angular
RUN yarn global add @angular/cli@7.3.5

EXPOSE 4200 49153

WORKDIR $APP_DIR