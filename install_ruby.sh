#!/bin/bash

shopt -s expad_aliases

sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  pushd ~/.rbenv && src/configure && make -C src
  popd
  echo '' >> ~/.bash_profile
  echo '# ruby' >> ~/.bash_profile
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  ~/.rbenv/bin/rbenv init
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
#  source ~/.bash_profile
}

install_ruby_build() {
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}

install_ruby() {
  rbenv install 2.3.3
  rbenv global 2.3.3
}

install_rbenv
install_ruby_build
install_ruby

rbenv -v
ruby -v
