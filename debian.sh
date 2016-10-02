#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade # sudo apt-get dist-upgrade

## docker
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo debian-jessie main' >> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo service docker start
# sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

## docker-compose
sudo apt-get install -y curl
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
exit
sudo chmod +x /usr/local/bin/docker-compose

## nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bash_profile
source ~/.bash_profile
nvm install v4.6.0 # fixme

## rbenv

