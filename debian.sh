#!/bin/bash

# Usage: `sudo ./debian.h`

# packages
apt-get update
apt-get -y upgrade
apt-get install -y git tmux curl tree

## alias
alias ll='ls -l'

## docker
## node
## ruby
## java
