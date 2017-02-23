#!/usr/bin/env bash
UPDATE_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${UPDATE_UBUNTU_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

thefuck(){
    sudo -H pip install thefuck
}

apt(){
    sudo apt --yes update -qq && shw_success "apt update"
    sudo apt --yes upgrade -qq && shw_success "apt upgrade"
    sudo apt --yes autoremove -qq && shw_success "apt autoremove"
}

main() {
    shw_start "Updating Ubuntu"
    apt
    thefuck
}
main

