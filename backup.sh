#!/usr/bin/env bash
BACKUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./utils/colors.sh

all()
{
    shw_start "Backing up"
}

function main() {
    if [ "$(uname)" == "Darwin" ]; then
        shw_info "OSX System Detected"
        all
        ./backup_scripts/osx.sh
    elif [ "$(exprsubstr$(uname-s)15)" == "Linux" ]; then
        shw_info "Linux System Detected"
        all
        ./backup_scripts/ubuntu.sh
    fi

    shw_success "Backing up"
}
main
