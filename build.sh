#!/bin/sh

docker run --rm -it  -v $(pwd):/app -w /app golang:alpine go build -o proxy main.go
docker build -t acker/go-openshift-proxy -f Dockerfile . 
