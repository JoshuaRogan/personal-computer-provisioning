#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./utils/utils.sh

#all() {
#    shw_
#}


main() {
    shw_start "Updating"
#    all
    if [ "$(uname)" == "Darwin" ]; then
        shw_info "OSX System Detected"
        brew update
        brew upgrade
        brew cleanup
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        shw_info "Linux System Detected"
        sudo apt --yes update
        sudo apt --yes upgrade
        sudo apt --yes autoremove
    fi
    shw_success "Updating"
}
main


