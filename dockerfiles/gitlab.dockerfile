FROM gitlab/gitlab-ce:latest

RUN apt-get update && apt-get install -y \
    nginx

WORKDIR /etc/nginx/conf.d
COPY conf/nginx.conf .
RUN mv nginx.conf default.conf

EXPOSE 80