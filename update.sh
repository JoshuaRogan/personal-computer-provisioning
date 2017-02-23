#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./utils/utils.sh

update_z() {
  #update z
  local filename=z.sh
  wget https://raw.githubusercontent.com/rupa/z/master/$filename -nv
  mv $filename ${INSTALL_DIR}/configs/
  shw_success "Updated Z.sh"
}

update_terminals() {
  #Update pretzo
  cd "${ZDOTDIR:-$HOME}/.zprezto" && git pull && git submodule update --init --recursive && shw_success "Updated prezto"

  #update oh my zsh
  cd "${ZDOTDIR:-$HOME}/.oh-my-zsh" && git pull && git submodule update --init --recursive && shw_success "Updated oh-my-zsh"
}

all() {
    update_terminals
    #Update pip
    pip install --upgrade pip && shw_success "Updated PIP"

    #thefuck
    sudo -H pip install thefuck

    update_z
}

apt(){
  sudo apt --yes update -qq && shw_success "apt update"
  sudo apt --yes upgrade -qq && shw_success "apt upgrade"
  sudo apt --yes autoremove -qq && shw_success "apt autoremove"
}

brew() {
  brew update
  brew upgrade
  brew cleanup
}

main() {
    shw_start_init "Updating"
    if [ "$(uname)" == "Darwin" ]; then
        shw_info "OSX System Detected"
        all
        brew
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        shw_info "Linux System Detected"
        all
        apt

    fi
    shw_success_final "Updated Completed"
}
main
