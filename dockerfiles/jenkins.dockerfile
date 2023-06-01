#Importing base image Ubuntu
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
#Updating and Upgrading Ubuntu
RUN apt-get -y update \
&& apt-get -y upgrade
#Installing Basic Packages & Utilities in Ubuntu
RUN apt-get -y install software-properties-common git gnupg sudo nano vim wget curl zip unzip build-essential libtool autoconf uuid-dev pkg-config libsodium-dev lynx-common tcl inetutils-ping net-tools ssh openssh-server openssh-client openssl letsencrypt apt-transport-https telnet locales gdebi lsb-release
#Clear cache
RUN apt-get clean
#Jenkins Prerequisites
RUN sudo apt search openjdk
#Install Java version 11 as prerequisite
RUN apt-get -y install openjdk-11-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64

#Install NGinx
RUN apt-get -y install nginx

#WORKDIR /etc/nginx/conf.d
#RUN cp default.sau default.old
#COPY conf/nginx/default.conf .

#Jenkins installation
#Download & add repository key
RUN wget -q -O — https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#Getting binary file into /etc/apt/sources.list.d
RUN sudo sh -c ‘echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list’
#Updating packages
RUN sudo apt-get update
#Installing Jenkins
RUN sudo apt-get -y install jenkins
#Start jenkins
RUN service jenkins start
#Expose port 8080
EXPOSE 8080
EXPOSE 80