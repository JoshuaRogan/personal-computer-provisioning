#!/usr/bin/env bash
INSTALL_OSX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_OSX_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

function install_homebrew() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
    brew doctor
}

function setup_iterm() {
    brew install zsh zsh-completions
}

function setup_dev() {
    brew install node yarn vim zsh zsh-completions

    #Oh my zsh

    #Presto

    #Vim
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}


################### MAIN FUNCTION ###################
function real_install() {
    shw_start "Installing OSX"
    install_homebrew
    setup_dev
    shw_success "Installing OSX"
}
################### MAIN FUNCTION ###################


### Uncomment before running
shw_warn "'install_scripts/osx.sh' is not fully installing. Uncomment out real_install"
#real_install
