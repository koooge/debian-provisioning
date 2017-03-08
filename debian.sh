#!/bin/bash

# Usage: `sudo ./debian.h`

## packages
apt-get update
apt-get -y upgrade
apt-get install -y git tmux curl \
    tree jq

## dotfiles
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

## aliases
echo "" >> ~/.bash_profile
echo "## aliases" >> ~/.bash_profile
echo "alias ll='ls -l'" >> ~/.bash_profile

## docker
## node
## ruby
## java
