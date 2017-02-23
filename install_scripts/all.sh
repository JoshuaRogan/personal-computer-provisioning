#!/usr/bin/env bash
INSTALL_ALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_ALL_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_prezto() {
    assert_file_does_not_exist "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" "Ignoring prezto already installed." &&
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

main() {
    install_prezto && shw_success "Prezto Installed"
}
main
