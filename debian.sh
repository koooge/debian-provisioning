#!/bin/bash

# Usage: `./debian.h`

## packages
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git tmux curl zip unzip \
    tree jq

## dotfiles
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

## aliases
echo "" >> ~/.bash_profile
echo "## aliases" >> ~/.bash_profile
echo "alias ll='ls -l'" >> ~/.bash_profile
