FROM nginx:stable-alpine
WORKDIR /etc/nginx/conf.d
COPY conf/nginx.conf .
RUN mv nginx.conf default.conf