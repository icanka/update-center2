#!/usr/bin/env bash

docker build . -t update-center2 || { echo "Failed to build Docker image" >&2 ; exit 1 ; }
docker-compose up -d