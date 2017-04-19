FROM alpine
COPY proxy /proxy
EXPOSE 80
ENV target=127.0.0.1
CMD ["/proxy"]
LABEL maintainer=albert.choi@gmail.com \
      source=https://github.com/ack/go-openshift-proxy \
      description="simple non-ssl reverse proxy. pass upstream as target= env var"
