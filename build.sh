#!/bin/bash

username=$(whoami)

docker build \
    --build-arg username="$username" \
    --rm -f "Dockerfile" \
    -t webstorm-docker:latest .