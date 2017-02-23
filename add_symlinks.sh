#!/usr/bin/env bash
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${ROOT_DIR}/configs/

source ${ROOT_DIR}/utils/utils.sh
source ./utils/utils.sh 2> /dev/null

shw_start "Symlinking Files"

#   $1 = destination (ex ~/)
#   $2 = filename
link_config() {
    mv_backup_file ${1} ${2}
    link_file ${CONFIG_DIR} $1 $2
    clr_reset " "
}

link_config ~/ .gitconfig
link_config ~/ .zshrc
link_config ~/.config/htop/ htoprc
link_config ~/ .zpreztorc
link_config ~/ .gitignore_global
link_config ~/ .vimrc

shw_success "Symlinking Files"
