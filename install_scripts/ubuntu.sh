#!/usr/bin/env bash
INSTALL_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_UBUNTU_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_httpstat() {
    pip install httpstat
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
}

install_go(){
    go get github.com/dborzov/lsp
}
main() {
    cmn_ask_to_continue "Do you want to install Ubuntu Programs"
    install_httpstat
    install_lnav
    setup_dev
}
main
