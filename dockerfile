FROM alpine:latest
RUN apk upgrade
RUN apk add nginx
COPY default.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/www/hello-world
WORKDIR /var/www/hello-world
COPY --chown=nginx:nginx hello-world/ .
EXPOSE 80
CMD [ "nginx", "-g", "pid /tmp/nginx.pid; daemon off;" ]