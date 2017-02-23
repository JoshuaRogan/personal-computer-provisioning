#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./utils/utils.sh


all() {
    #Update pretzo
    cd "${ZDOTDIR:-$HOME}/.zprezto" && git pull && git submodule update --init --recursive && shw_success "Updated prezto"

    #update oh my zsh
    cd "${ZDOTDIR:-$HOME}/.oh-my-zsh" && git pull && git submodule update --init --recursive && shw_success "Updated oh-my-zsh"

    #Update pip
    pip install --upgrade pip && shw_success "Updated PIP"

    #thefuck
    sudo -H pip install thefuck
}

main() {
    shw_start "Updating"
    if [ "$(uname)" == "Darwin" ]; then
        shw_info "OSX System Detected"
        all
        brew update
        brew upgrade
        brew cleanup
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        shw_info "Linux System Detected"
        all
        sudo apt --yes update
        sudo apt --yes upgrade
        sudo apt --yes autoremove
    fi
    shw_success "Updating"
}
main

