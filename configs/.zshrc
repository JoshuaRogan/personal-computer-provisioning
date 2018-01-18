#!/usr/bin/env bash

# Must Install List
# diff2Html
# tejira
#

########### Helpers ###########
osis(){
    local n=0
    if [[ "$1" = "-n" ]]; then n=1;shift; fi

    # echo $OS|grep $1 -i >/dev/null
    uname -s |grep -i "$1" >/dev/null

    return $(( $n ^ $? ))
}

include(){
    [[ -f "$1" ]] && source "$1"
}

addPath(){
  export PATH=${PATH}:"$1"
}

########### Config ###########
USE_PRESTO=true
USE_OHMYZSH=false
PROVISION_DIR="${HOME}/projects/personal-computer-provisioning/"
PROVISION_CONFIG_DIR="${PROVISION_DIR}/configs"
NOTES_DIRECTORY="${HOME}/Google\ Drive/notes"

########### Exports ###########
export EDITOR=vim
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"

########### Paths ###########
addPath "$HOME/.basher/bin:$PATH"
addPath "$HOME/.config/composer/vendor/bin"
addPath "$HOME/go/bin"
addPath "$HOME/.composer/vendor/bin"
addPath "$HOME/.local/bin"

########### Evals ###########
eval "$(basher init -)"
eval "$(rbenv init -)"

########### Sourcing ###########
include "$HOME/.fzf.zsh"
include "$NVM_DIR/nvm.sh"
include "$HOME/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh"

osis Darwin && {
  include "${HOME}/.iterm2_shell_integration.zsh"
}

################################# GREETING #################################
function welcome(){
    local OSINFO="$(ansi -n --yellow $(uname -a))"
    local NAME="$(ansi -n --blue $(whoami))"
    ansi -n --green "$(cowsay -W 70 -f stegosaurus $(fortune -o))"
    echo "\n"
    ansi -n --yellow "$(uname -v)"
}

which -s cowsay && which -s fortune && welcome
################################# GREETING #################################

################################# Prezto #################################
if [ "$USE_PRESTO" = true ] ; then
    include "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    include "${PROVISION_CONFIG_DIR}/z.sh"
fi

################################# Oh My ZSH #################################
if [ "$USE_OHMYZSH" = true ] ; then
    # See https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template

    export ZSH=~/.oh-my-zsh
    ZSH_THEME="theunraveler"
    include $ZSH/oh-my-zsh.sh

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"
    plugins=(nvm git bundler osx command-not-found Composer common-aliases npm pip vagrant sudo gulp z sublime yeoman extract h httpie laravel5)

fi

################################# Additional Options #################################
# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

################################# ALIASES #################################

########## DOT FILE EDITING ##########
alias .tmux='vim ~/.tmux.conf.local'
alias .vimrc='vim ~/.vimrc'
alias .git='vim ~/.gitconfig'
alias .gitconfig='vim ~/.gitconfig'
alias .zshrc='vim ~/.zshrc'

########### MISC ##########
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias chrome='google-chrome'
alias clean='sudo pkill -9 php && sudo pkill -9 node && sudo pkill -9 npm'
alias f2='tmux attach-session -t f2'
alias ldot='ls -d .*'
alias lsa='ls -lah'
alias profile='vim ~/.zshrc'
alias reload='source ~/.zshrc'
alias weather='http wttr.in/94107'
alias wget='http -d'
alias upstream='tmux attach-session -t upstream'
alias vpn-connect='expressvpn connect'
alias vpn-disconnect='expressvpn disconnect'
alias vpn='expressvpn status'

########## NODE ########## 
alias nodei="node --inspect"

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
alias wikia-assets='rsync -av --delete --progress /Users/joshrogan/projects/dev-assets/ jrogan@dev-jrogan:~/dev-assets'
alias wikia-upload='rsync -av --delete --progress . jrogan@dev-jrogan:~/dev-assets/dirs/'
alias wikia='ssh jrogan@dev-jrogan'
alias wikia-dev-key="curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'username=jrogan92&password=570309118Five' 'https://services.wikia-dev.us/auth/token'"

# Quick JW Player lookups
jw() {
    http "http://cdn.jwplayer.com/v2/media/${1}"
}

# Open a jira issue
issue() {
    jira issue "FAN-${1}"
}

osis Linux && {
  alias wikia-vpn='sudo openvpn --config ~/projects/vpn-stuff/openvpn '
  alias wikia-vpn-routes='sudo route add 10.8.68.166 dev tun0 || sudo route add 10.8.76.24 dev tun0 || sudo route add 10.8.40.111 dev tun0 || sudo route add 10.8.44.90 dev tun0'
  alias wikia-vpn-off='sudo cp ~/resolv.conf.deafult /etc/resolv.conf'
  alias wikia-vpn-on='sudo cp ~/resolv.conf.wikia /etc/resolv.conf'
}

which -s hub && {
    alias git=hub
    alias issues="git browse -- issues"
}
################################# ALIASES #################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
