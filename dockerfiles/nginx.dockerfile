FROM nginx:stable-alpine
WORKDIR /etc/nginx/conf.d
RUN cp default.conf default.old
COPY conf/nginx/default.conf .