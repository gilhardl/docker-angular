ARG NODE_VERSION=10.15
ARG ANGULAR_VERSION=7.3.6

FROM node:$NODE_VERSION-alpine

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="7.3.6"
LABEL description="Docker image for Angular development"

WORKDIR "/usr/src/app/"

USER root

# Linux setup
RUN apk update \
  && apk upgrade \
  && apk add bash bash-completion \
  && rm -rf /tmp/* /var/cache/apk/* \
  && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# NPM setup
RUN rm -rf ~/.npm \
  && npm cache verify \
  && echo "unsafe-perm = true" >> ~/.npmrc \
  && mkdir ~/.npm-global \
  && npm config set prefix '~/.npm-global' \
  && echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile

# Yarn
RUN apk add yarn

# Angular
RUN yarn global add @angular/cli@$ANGULAR_VERSION

EXPOSE 4200 49153

CMD ["bash"]