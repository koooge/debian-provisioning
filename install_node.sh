#!/bin/bash

shopt -s expand_aliases

install_nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
  echo '' >> ~/.bash_profile
  echo '# node' >> ~/.bash_profile
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
  echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bash_profile
  source ~/.bash_profile
}

install_node() {
  nvm install lts/boron
  nvm use lts/boron
}

install_nvm
install_node

nvm version
node -v
