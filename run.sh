#!/bin/bash

cache="/home/andrei/dockerbuilds/webstorm-docker/.cache"
webstorm="/home/andrei/dockerbuilds/webstorm-docker/.WebStorm2019.2"
java="/home/andrei/dockerbuilds/webstorm-docker/.java"
projects="/home/andrei/WebstormProjects"

if [ -d  "$cache" ]
then 
    echo "Directory $cache exists."
else
    mkdir -p $cache
    echo "Directory $cache created."
fi

if [ -d  "$webstorm" ]
then 
    echo "Directory $webstorm exists."
else
    mkdir -p $webstorm
    echo "Directory $webstorm created."
fi

if [ -d  "$java" ]
then 
    echo "Directory $java exists."
else
    mkdir -p $java
    echo "Directory $java created."
fi

if [ -d  "$projects" ]
then 
    echo "Directory $projects exists."
else
    mkdir -p $projects
    echo "Directory $projects created."
fi

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $cache:/home/andrei/.cache \
    -v $webstorm:/home/andrei/.WebStorm2019.2 \
    -v $java:/home/andrei/.java \
    -v $projects:/home/andrei/WebstormProjects/ \
    webstorm-docker:latest