#!/usr/bin/env bash

########### Config ###########
USE_PRESTO=true
USE_OHMYZSH=false
PROVISION_DIR="${HOME}/projects/personal-computer-provisioning/"
PROVISION_CONFIG_DIR="${PROVISION_DIR}/configs"

########### Exports ###########
export EDITOR=vim
export GOPATH=~/go
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.basher/bin:$PATH"
export PATH=${PATH}:"$HOME/.config/composer/vendor/bin"
export PATH=${PATH}:/usr/local/opt/gettext/bin
export PATH=${PATH}:~/go/bin

########### Evals ###########
eval $(thefuck --alias)
eval "$(basher init -)"

########### Sourcing ###########
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f "$HOME/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh" ] && source "$HOME/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh"
[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

################################# GREETING #################################
function welcome(){
    local OSINFO="$(ansi -n --yellow $(uname -a))"
    local NAME="$(ansi -n --blue $(whoami))"
    ansi -n --green "$(cowsay -W 70 -f stegosaurus $(fortune -o))"
    echo "\n"
    ansi -n --yellow "$(uname -v)"
}
welcome
################################# GREETING #################################

################################# Prezto #################################
if [ "$USE_PRESTO" = true ] ; then

    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    # Add Z
    source "${PROVISION_CONFIG_DIR}/z.sh"

fi

################################# Oh My ZSH #################################
if [ "$USE_OHMYZSH" = true ] ; then
    # See https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template

    export ZSH=~/.oh-my-zsh
    ZSH_THEME="theunraveler"
    source $ZSH/oh-my-zsh.sh

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"
    plugins=(nvm git bundler osx command-not-found Composer common-aliases npm pip vagrant sudo gulp z sublime yeoman extract h httpie laravel5)

fi

################################# Additional Options #################################
# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

################################# ALIASES #################################
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias ldot='ls -d .*'
alias lsa='ls -lah'
alias profile='vim ~/.zshrc'
alias reload='source ~/.zshrc'

########### CURL STUFF ###########
alias header='httpstat'
alias http='time http'
alias search='ag'

########### SSH STUFF ###########
alias droplet-josh='ssh josh@droplet.joshuarogan.com'
alias droplet-root='ssh root@droplet.joshuarogan.com'
alias droplet='ssh josh@droplet.joshuarogan.com'

####### Wikia #######
alias wikia-deploy='ssh jrogan@deploy-s1'
alias wikia-push='rsync -av --delete --progress /Users/joshrogan/projects/wikia/ jrogan@dev-jrogan:/usr/wikia/source/app/'
alias wikia-vpn='sudo openvpn --config ~/projects/personal-computer-provisioning/configs/vpn/config1.ovpn'
alias wikia='ssh jrogan@dev-jrogan'

################################# ALIASES #################################
