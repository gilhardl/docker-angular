ARG NODE_VERSION=10.15
FROM gilhardl/node:$NODE_VERSION

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL description="Docker image for Angular development"

WORKDIR /usr/src/app/

USER root

# ANGULAR
RUN npm install -g @angular/cli

# EXPOSE PORTS
EXPOSE 4200 49153

CMD ["bash"]