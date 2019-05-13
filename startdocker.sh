#!/bin/bash

docker build -t twitch-docker-image .
docker run -it -v ${PWD}:/usr/src/app -p 80:8080 twitch-docker-image /bin/bash
