# docker-angular

Docker image for Angular development, based on [gilhardl/node](https://github.com/gilhardl/docker-node)

[![Docker Pulls](https://img.shields.io/docker/pulls/gilhardl/angular.svg?style=flat-square&label=PULLS)](https://hub.docker.com/r/gilhardl/angular/)

---

![OS](https://img.shields.io/static/v1.svg?style=flat-square&label=OS&message=Linux%20Alpine)

![ANGULAR CLI](https://img.shields.io/npm/v/@angular/cli.svg?style=flat-square&label=ANGULAR%20CLI)

![NODE](https://img.shields.io/npm/v/node/lts.svg?style=flat-square&label=NODE)
![NPM](https://img.shields.io/npm/v/npm/lts.svg?style=flat-square&label=NPM)
![YARN](https://img.shields.io/npm/v/yarn/latest.svg?style=flat-square&label=YARN)

![PACKAGE MANAGER](https://img.shields.io/static/v1.svg?style=flat-square&label=PACKAGE%20MANAGER&message=Yarn)

---

# Usage

## With docker

### Basic usage

Start CLI :
```
docker run -it --name angular -v /path/to/your/project:/usr/src/app gilhardl/angular
```
Start CLI and expose ports to be able to serve the app :
```
docker run -it --name angular -v /path/to/your/project:/usr/src/app -p 4200:4200 -p 49153:49153 gilhardl/angular
```

Serving your app :

In order to get livereload working, you'll need to define the file watching poll time to 1ms :
```
ng serve --host=0.0.0.0 --poll 1
```
You also need to specify `0.0.0.0` to get access from your host browser

### Walkthrough

1. Run Angular container to use Angular CLI
```
docker run -it --name angular -v /path/to/your/project:/usr/src/app -p 4200:4200 -p 49153:49153 gilhardl/angular
```

2. Use Angular CLI

Create a project :
```
ng new yourapp

? Would you like to add Angular routing? Yes
? Which stylesheet format would you like to use? CSS

...
```

Serve your app :
```
ng serve --host=0.0.0.0 --poll 1
```

## With docker-compose

Create a file named `docker-compose.yml` at your project root like the following :
```
version: '3'

services:
  app:
    container_name: yourapp-app
    build: .
    image: gilhardl/angular
    ports:
      - 4200:4200
      - 49153:49153
    volumes:
      - .:/usr/src/app/
    command: ng serve --host=0.0.0.0 --poll 1
    restart: always
```

Serve your app :
```
docker-compose up
```

# Licence

MIT
