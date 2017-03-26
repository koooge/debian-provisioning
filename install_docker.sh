#!/bin/bash

# Usage: `./install_docker.sh`

## docker
install_docker() {
  apt-get update
  apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

  add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) \
         stable"

  apt-get update
  apt-get install -y docker-ce
  systemctl start docker

  gpasswd -a ${USER} docker
  systemctl restart docker
}

## dockere-compose
install_docker_compose() {
  COMPOSE_VER=1.11.2
  curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

install_docker
install_docker_compose

docker -v
docker-compose -v
