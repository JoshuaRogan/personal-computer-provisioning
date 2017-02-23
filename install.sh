#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./utils/utils.sh

all() {
    ./add_symlinks.sh
    ./install_scripts/all.sh
}


main() {
    shw_start "Installing"
    cmn_ask_to_continue "Do you want to install programs"
    all
    if [ "$(uname)" == "Darwin" ]; then
        shw_info "OSX System Detected"
        ./install_scripts/osx.sh
    elif [ "$(exprsubstr$(uname-s)15)" == "Linux" ]; then
        shw_info "Linux System Detected"
        ./install_scripts/ubuntu.sh
    fi
    shw_success "Installing"
}
main


