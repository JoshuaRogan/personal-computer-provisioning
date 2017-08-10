#!/usr/bin/env bash
INSTALL_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_UBUNTU_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_httpstat() {
    wget https://raw.githubusercontent.com/reorx/httpstat/master/httpstat.py
    chmod u+x httpstat.py
    sudo mv httpstat.py /usr/local/bin/httpstat
}

install_lnav() {
    local filename=lnav-0.8.1-linux-64bit.zip
    wget https://github.com/tstack/lnav/releases/download/v0.8.1/$filename -nv
    unzip $filename
    rm -f $filename
    sudo cp lnav-0.8.1/lnav /usr/local/bin/lnav
    rm -rf lnav-0.8.1
}

setup_dev(){
    sudo apt --yes install golang cowsay fortune fortunes-off
    git clone https://github.com/basherpm/basher.git ~/.basher
}

install_go(){
    go get github.com/dborzov/lsp
}

install_basher(){
  git clone https://github.com/basherpm/basher.git ~/.basher
  basher install fidian/ansi
}

install_yarn(){
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install yarn
}

install_nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
}

install_php() {
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt update
  sudo apt install php7.1 php7.1-mbstring php7.1-mcrypt php7.1-mcrypt
}

install_guake() {
  sudo add-apt-repository ppa:webupd8team/unstable -y
  sudo apt update && sudo apt install guake
}

install_composer() {
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  sudo mv composer.phar /usr/local/bin/
}

main() {
    # install_php
    # install_composer
    # cmn_ask_to_continue "Do you want to install Ubuntu Programs"
    # install_httpstat
    # install_lnav
    # setup_dev
    # install_yarn
    # install_node
    # install_guake
    # install_httpstat
}
main
