#!/bin/bash

RUBY_VERSION=2.4.0


install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src && cd -
  ~/.rbenv/bin/rbenv init
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

  echo '' >> ~/.bash_profile
  echo '# ruby' >> ~/.bash_profile
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
}

install_ruby_build() {
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  apt-get install -y libssl-dev libreadline-dev zlib1g-dev
}

install_ruby() {
  rbenv install ${RUBY_VERSION}
  rbenv local ${RUBY_VERSION}
  rbenv global ${RUBY_VERSION}
  rbenv rehash

  gem update --system
  gem install bundler pry pry-doc --no-document
}

install_rbenv
install_ruby_build
install_ruby

rbenv -v
ruby -v
