FROM golang
ADD main.go .
RUN go build -o /bin/proxy main.go
ENV target=127.0.0.1
ENTRYPOINT /bin/proxy
EXPOSE 80
LABEL maintainer=albert.choi@gmail.com \
      source=https://github.com/ack/go-openshift-proxy \
      description="simple non-ssl reverse proxy. pass upstream as target= env var"
