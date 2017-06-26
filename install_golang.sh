#!/bin/bash

# Usage `./install_golang.sh && source ~/.bash_profile`

GO_VERSION="1.8.3"

GO_URL=https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz

install_golang() {
  wget -O - ${GO_URL} | sudo tar zxC /usr/local

  cp ./.bash.d/go.sh ${HOME}/.bash.d/
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/dev
}

go_get_packages() {
  GO_CMD=golang.org/x/tools/cmd
  go get ${GO_CMD}/godoc
  go get ${GO_CMD}/goimports
#  go get ${GO_CMD}/golint
#  go get ${GO_CMD}/gorename
#  go get ${GO_CMD}/guru
#  go get github.com/motemen/gore
#  go get github.com/motemen/ghq
#  go get github.com/nsf/gocode
#  go get github.com/rogpeppe/godef
#  go get github.com/jstemmer/gotags
#  go get github.com/k0kubun/pp
#  go get github.com/Masterminds/glide
}

install_golang
go_get_packages

go version
