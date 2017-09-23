#!/usr/bin/env bash
INSTALL_ALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_ALL_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_prezto() {
    assert_file_does_not_exist "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" "Ignoring prezto already installed." &&
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

install_ansi() {
  curl -OL git.io/ansi
  chmod 755 ansi
  sudo mv ansi /usr/local/bin/
}

install_cowsay() {
  curl -OL git.io/ansi
  chmod 755 ansi
  sudo mv ansi /usr/local/bin/
}

install_webdriver() {
    mkdir webdriverio-test && cd webdriverio-test
    curl -O http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar
    curl -L https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-macos.tar.gz | tar xz
#    java -jar -Dwebdriver.gecko.driver=./geckodriver selenium-server-standalone-3.0.1.jar
}

install_tmux() {
    cd ~
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
}

setup_dev() {
    npm install --global --no-optional phantomas phantomjs-prebuilt@^2.1.5
}

main() {
    install_prezto && shw_success "Prezto Installed"
    install_ansi && shw_success "Ansi Installed"
    install_tmux && shw_success "Oh my tmux Installed"
}
main
