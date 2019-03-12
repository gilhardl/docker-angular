# docker-angular

[![Docker Pulls](https://img.shields.io/docker/pulls/gilhardl/angular.svg)](https://hub.docker.com/r/gilhardl/angular/)

Docker image for Angular development

----------------------------------------

**Angular CLI :** 7.3.5

**Node.js :** v10.15.3

**NPM :** v6.4.1

**Yarn :** 1.13.0

**OS :** Linux alpine x64

**Package manager:** yarn

----------------------------------------


# Usage

```
docker run -it --name ANGULAR -v /c/Users/LG/Work:/app -p 4200:4200 -p 49153:49153 gilhardl/angular sh
```

Then you should be able to use Angular CLI from your container shell

### Serving your app

In order to get livereload working, you'll need to define the file watching poll time to 1ms

```
ng serve --host=0.0.0.0 --poll 1
```

You need to specify `0.0.0.0` to access your app from your host browser

# Licence

MIT