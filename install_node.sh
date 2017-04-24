#!/bin/bash

# Usage: `./install_node.sh`

shopt -s expand_aliases

install_nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
  cp ./.bash.d/node.sh ${HOME}/.bash.d/
  source ${HOME}/.bash.d/node.sh
}

install_node() {
  nvm install lts/boron
  nvm use lts/boron
}

install_nvm
install_node

nvm version
node -v
