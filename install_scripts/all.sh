#!/usr/bin/env bash
INSTALL_ALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_ALL_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_prezto() {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

install_lnav() {
    local filename=lnav-0.8.1-linux-64bit.zip
    wget https://github.com/tstack/lnav/releases/download/v0.8.1/$filename
    unzip $filename
    rm -f $filename
    sudo cp lnav-0.8.1/lnav /usr/local/bin/lnav
    rm -rf lnav-0.8.1
}

main() {
    install_prezto
}
main
