#!/usr/bin/env bash
UPDATE_OSX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${UPDATE_OSX_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

thefuck() {
    pip install thefuck
}

brew_updates() {
    brew update
    brew upgrade
    brew cleanup
}

main() {
    shw_start "Updating OSX"
    brew_updates
    thefuck
}
main
