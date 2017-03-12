#!/bin/bash

# Usage: `./install_java.sh`

install_sdkman() {
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

install_java() {
  sdk install java
}

install_maven() {
  sdk install maven
}

install_sdkman
install_java
install_maven

sdk version
java -version
mvn -v
