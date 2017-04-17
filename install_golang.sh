#!/bin/bash

# Usage `./install_golang.sh && source ~/.profile`

GO_URL=https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz

install_golang() {
  wget -O - ${GO_URL} | sudo tar zxC /usr/local

  export PATH=$PATH:/usr/local/go/bin
  echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
}

install_golang
