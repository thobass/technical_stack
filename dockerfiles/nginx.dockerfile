FROM nginx:stable-alpine
WORKDIR /etc/nginx/conf.d
RUN cp default.conf default.old
COPY conf/nginx/basset.rocks.conf .
COPY conf/nginx/jenkins.basset.rocks.conf .
COPY conf/nginx/gitlab.basset.rocks.conf .