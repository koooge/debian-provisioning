#!/bin/bash

# Usage: `./debian.h`

## packages
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git tmux curl zip unzip \
    gcc g++ make \
    tree jq \
    vim

## dotfiles
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

## aliases
cat << EOS >> ~/.bash_profile

## aliases
alias ll='ls -l'
EOS
