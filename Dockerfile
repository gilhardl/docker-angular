ARG NODE_VERSION=10.15
ARG ANGULAR_VERSION=7.3.6

FROM node:$NODE_VERSION-alpine

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="7.3.6"
LABEL description="Docker image for Angular development"

WORKDIR /usr/src/app/

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
  && npm config set prefix '/usr/local/share/.npm-global' \
  && echo "export PATH=/usr/local/share/.npm-global/bin:$PATH" >> ~/.bashrc \
  && echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc

# Yarn
RUN apk add yarn

# Angular
RUN yarn global add @angular/cli@$ANGULAR_VERSION

EXPOSE 4200 49153

CMD ["bash"]