#!/bin/sh

# https://www.linkedin.com/pulse/installing-openjdk-8-tomcat-debian-jessie-iga-made-muliarsa

# java
sudo sh -c "echo 'deb http://ftp.de.debian.org/debian jessie-backports main' >> /etc/apt/sources.list.d/java.list"
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

java -version