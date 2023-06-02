FROM nginx:stable-alpine
WORKDIR /etc/nginx/conf.d
RUN cp default.sau default.old
COPY conf/nginx/basset.rocks.conf .
COPY conf/nginx/jenkins.basset.rocks.conf .