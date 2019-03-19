ARG NODE_VERSION=10.15
ARG ANGULAR_VERSION=7.3.6

FROM gilhardl/node:$NODE_VERSION

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="7.3.6"
LABEL description="Docker image for Angular development"

WORKDIR /usr/src/app/

USER root

# Angular
RUN yarn global add @angular/cli@$ANGULAR_VERSION

EXPOSE 4200 49153

CMD ["bash"]