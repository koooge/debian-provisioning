#!/bin/sh

sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

## rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo '' >> ~/.bash_profile
echo '# ruby' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

## ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

## ruby
rbenv install 2.3.1

rbenv -v
ruby -v