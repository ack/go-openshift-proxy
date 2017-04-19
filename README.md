# go-openshift-proxy

A simple wrapper around net/http/httputil/ReverseProxy

binds to :80 and proxies all requests to upstream env variable `target`

build: 

  `docker run -p $(pwd):/ -w / golang:alpine go build -o proxy main.go`
  `docker build -t go-openshift-proxy -f Dockerfile .`

use: 

  `docker rm -f os-lb`
  `docker run -d --name os-lb -d -p 80:80 -e target=$(oc get service router -o=json | jq -r '.spec.clusterIP') acker/go-openshift-proxy`


