# go-openshift-proxy

A simple wrapper around net/http/httputil/ReverseProxy

binds to :80 and proxies all requests to upstream env variable `target`

usage: 

  `docker run -d -p 80:80 -e target=172.18.33.196 ack/go-openshift-proxy`


