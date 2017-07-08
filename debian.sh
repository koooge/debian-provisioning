#!/bin/bash

# Usage: `./debian.sh && . ~/.bash_profile`

## packages
install_apt_packages() {
  echo "set grub-pc/install_devices /dev/sda" | sudo debconf-communicate
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get install -y git tmux curl zip unzip \
      gcc g++ make \
      global tig tree jq dos2unix \
      vim
}

## install packages
install_packages() {
  ./install_ruby.sh
  # ./install_java.sh
  ./install_node.sh
  ./install_golang.sh
  ./install_docker.sh
  # ./install_embulk.sh
}

install_apt_packages
install_packages

## dotfiles
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

## .bash_profile
mkdir -p ${HOME}/.bash.d

cat << \EOS >> ${HOME}/.bash_profile
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# load bash flagment
if [ -d "${HOME}/.bash.d" ] ; then
  for f in ${HOME}/.bash.d/*.sh ; do
    [ -s "$f" ] && . "$f"
  done
  unset f
fi

PATH=$PATH:${HOME}/.local/bin:${HOME}/bin

# prompt
git_branch() {
  echo $(git branch 2> /dev/null | sed -n 's/^\* \(.*\)$/(\1)/p')
}
PS1='\033[01;34m\]$(git_branch)\[\033[00m\]:\w\n\$ '
EOS

export PATH
