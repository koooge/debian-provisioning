#!/bin/bash

## docker
install_docker() {
  apt-get update
  apt-get install -y apt-transport-https ca-certificates
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo 'deb https://apt.dockerproject.org/repo debian-jessie main' >> /etc/apt/sources.list.d/docker.list
  apt-get update
  apt-cache policy docker-engine
  apt-get install -y docker-engine
  service docker start

  ### sudo groupadd docker
  gpasswd -a ${USER} docker
  service docker restart
}

## dockere-compose
install_docker_compose() {
  curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

install_docker
install_docker_compose

docker -v
docker-compose -v
