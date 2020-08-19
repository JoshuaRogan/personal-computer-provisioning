#!/usr/bin/env bash

zmodload zsh/zprof

# Must Install List
# diff2Html
# tejira
# tig

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
PROJECTS_DIR="${HOME}/projects/"
PROVISION_DIR="${PROJECTS_DIR}personal-computer-provisioning/"
FORTUNES_DATA="${HOME}/projects/personal-computer-provisioning/fortunes"
PROVISION_CONFIG_DIR="${PROVISION_DIR}/configs"
NOTES_DIRECTORY="${HOME}/Google\ Drive/notes"

########### Exports ###########
export EDITOR=vim
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"
export KEYTIMEOUT=1
export HISTSIZE=100000

########## Paths ###########
addPath "$HOME/.config/composer/vendor/bin"
addPath "$HOME/go/bin"
addPath "$HOME/.composer/vendor/bin"
addPath "$HOME/.local/bin"
addPath "$HOME/bin"
addPath "$HOME/.config/yarn/global/bin"
addPath "$HOME/.config/yarn/global/bin/bin"
addPath "$HOME/config/yarn/global/bin/bin"
addPath "$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

########### Evals ###########
#eval "$(basher init -)"
#eval "$(rbenv init -)"
#eval "$(pipenv --completion)"

########### Sourcing ###########
#include "$HOME/.fzf.zsh"
include "$NVM_DIR/nvm.sh"

########### Mac Only ###########
osis Darwin && {
  include "${HOME}/.iterm2_shell_integration.zsh"
}

########### Dev Box Only ###########
if [[ $(whoami) = "jrogan" ]];
then
  echo "Devbox"
fi

################################# GREETING #################################
function welcome(){
    local OSINFO="$(ansi -n --yellow $(uname -a))"
    local NAME="$(ansi -n --blue $(whoami))"
    ansi -n --blue "$(cowsay -W 70 -f "${PROVISION_DIR}cows/lobster.cow" $(fortune ${FORTUNES_DATA}))"
    echo "\n"
#    ansi -n --yellow "$(uname -v)"
}

which -s cowsay 1> /dev/null && which -s fortune 1> /dev/null && welcome
################################# GREETING #################################

################################# Prezto #################################
include "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
include "${PROVISION_CONFIG_DIR}/z.sh"

################################# Additional Options #################################
# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

################################# ALIASES #################################

########## DOT FILE EDITING ##########
alias .git='vim ~/.gitconfig'
alias .gitconfig='vim ~/.gitconfig'
alias .p10k='vim ~/.p10k.zsh'
alias .tmux='vim ~/.tmux.conf.local'
alias .vimrc='vim ~/.vimrc'
alias .zshrc='vim ~/.zshrc'

########### MISC ##########
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias cat='bat'
alias chrome='google-chrome'
alias clean='sudo pkill -9 php && sudo pkill -9 node && sudo pkill -9 npm && killnode'
alias ldot='ls -d .*'
alias killnode='echo "=> Killing nodejs and webpack" && pkill -9 node && pkill -9 webpack-serve && pkill -9 webpack && pkill -9 nohup && pkill -9 wdio && pkill -9 BrowserStackLocal'
alias lsa='ls -lah'
alias ping='prettyping'
alias profile='vim ~/.zshrc'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias reload='source ~/.zshrc'
alias twitter='rainbowstream'
alias weather='http wttr.in/94107'
alias wget='http -d'
alias wip='git add -A && git cam "WIP"'
alias wipu='git reset HEAD~'
alias yarnc='echo "=> Deleting node_modules" && rm -rf node_modules && yarn'

########## APPLICATION OPEN ##########
alias intellij='open -a "IntelliJ IDEA 3"'
alias vscode='open -a "Visual Studio Code"'

########## INTELLI OPENS ##########
alias f2="intellij ${PROJECTS_DIR}f2"
alias personal="intellij ${PROVISION_DIR}"
alias react-common="intellij ${PROVISION_DIR}react-common"
alias ucp="unified-platform"
alias unified-platform="intellij ${PROJECTS_DIR}unified-platform"
alias upstream="intellij ${PROJECTS_DIR}upstream"

########## NODE ##########
alias nodei="node --inspect"

########### NETWORK STUFF ###########
alias header='httpstat'
alias http='time http'
alias search='ag'

########### SSH STUFF ###########
alias droplet-josh='ssh josh@droplet.joshuarogan.com'
alias droplet-root='ssh root@droplet.joshuarogan.com'
alias droplet='ssh josh@droplet.joshuarogan.com'

####### FANDOM #######
alias board='jira issue ls'
alias wikia='ssh jrogan@dev-jrogan-18'
alias fandom='ssh jrogan@dev-jrogan-18'


# Get fastly debug headers
fandom-header() {
    httpstat "${1}" -H 'Fastly-Debug: 1'
}

# Open a jira issue
issue() {
    jira issue "CAKE-${1}"
}

# Testing bootup time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh
