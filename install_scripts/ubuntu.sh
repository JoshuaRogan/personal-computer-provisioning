#!/usr/bin/env bash
INSTALL_UBUNTU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_UBUNTU_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_httpstat() {
    pip install httpstat
}

main() {
    install_httpstat
}
main
