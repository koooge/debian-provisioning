#!/bin/bash

# Usage: `sudo ./install_java.sh`

install_java() {
  echo "deb http://ftp.jp.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list
  apt-get update
  apt install -y -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
  apt-get install -y openjdk-8-jdk
}

install_java

java -version
