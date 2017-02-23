#!/usr/bin/env bash
INSTALL_OSX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${INSTALL_OSX_DIR}/../utils/utils.sh
source ./../utils/utils.sh 2> /dev/null

install_homebrew() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
    brew doctor
}

install_lnav() {
    local filename=lnav-0.8.1-os-x.zip
    wget https://github.com/tstack/lnav/releases/download/v0.8.1/$filename
    unzip $filename
    rm -f $filename
    cp lnav-0.8.1/lnav /usr/local/bin/lnav4
    rm -rf lnav-0.8.1
}

setup_iterm() {
    brew install zsh zsh-completions
}

setup_dev() {
    brew install node yarn vim zsh zsh-completions

    #Oh my zsh

    #Presto

    #Vim
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh

    install_lnav
}


################### MAIN FUNCTION ###################
main() {
    cmn_ask_to_continue "Do you want to install OSX Programs"
    shw_start "Installing OSX"
    install_homebrew
    setup_dev
    shw_success "Installing OSX"
}
main
################### MAIN FUNCTION ###################
