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

## .bash_profile
mkdir -p ${HOME}/.bash.d

cat << EOS >> ${HOME}/.bash_profile
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# load bash flagment
if [ -d "${HOME}/.bash.d" ] ; then
    for f in "${HOME}"/.bash.d/*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin
EOS

export PATH
