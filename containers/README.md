# Dockerfiles

This directory contains the *Dockerfiles* and associated configuration files to build the various IXP Manager containers.

The resultant containers can be found at: https://hub.docker.com/u/ixpmanager/


## Development Notes

Each container can be built via (using `www` as an example):

```
cd www
docker build -t ixpmanager/www:4.7.1 .
docker push ixpmanager/www:4.7.1
```
