#!/bin/bash
set -e

APP_NAME=mywebapp-insecure
VERSION=1.0

#BUILD: Clenaup old container/build image
docker rm -f $APP_NAME 2>/dev/null || true
docker build -t $APP_NAME:$VERSION . 

#TEST: Run the container
docker run -d -p 80:80 --name $APP_NAME:$VERSION webapp-nginx:latest

