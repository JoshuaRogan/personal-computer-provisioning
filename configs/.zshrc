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
USE_PRESTO=true
PROVISION_DIR="${HOME}/projects/personal-computer-provisioning/"
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
#addPath "$HOME/.basher/bin:$PATH"
addPath "$HOME/.config/composer/vendor/bin"
addPath "$HOME/go/bin"
addPath "$HOME/.composer/vendor/bin"
addPath "$HOME/.local/bin"
addPath "$HOME/bin"
addPath "$HOME/.config/yarn/global/bin"
addPath "$HOME/.config/yarn/global/bin/bin"
addPath "$HOME/config/yarn/global/bin/bin"
#addPath "$HOME/Library/Python/3.6/bin"
addPath "$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

########### Evals ###########
#eval "$(basher init -)"
#eval "$(rbenv init -)"
#eval "$(pipenv --completion)"

########### Sourcing ###########
#include "$HOME/.fzf.zsh"
#include "$NVM_DIR/nvm.sh"

osis Darwin && {
  include "${HOME}/.iterm2_shell_integration.zsh"
}

################################# GREETING #################################
function welcome(){
    local OSINFO="$(ansi -n --yellow $(uname -a))"
    local NAME="$(ansi -n --blue $(whoami))"
    ansi -n --blue "$(cowsay -W 70 -f "${PROVISION_DIR}cows/lobster.cow" $(fortune ${FORTUNES_DATA}))"
    echo "\n"
#    ansi -n --yellow "$(uname -v)"
}

#which -s cowsay && which -s fortune && welcome
welcome
################################# GREETING #################################

################################# Prezto #################################
include "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
include "${PROVISION_CONFIG_DIR}/z.sh"


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
alias cat='bat'
alias chrome='google-chrome'
alias clean='sudo pkill -9 php && sudo pkill -9 node && sudo pkill -9 npm'
alias f2='tmux attach-session -t f2'
alias ldot='ls -d .*'
alias killnode='echo "=> Killing nodejs and webpack" && pkill -9 node && pkill -9 webpack-serve && pkill -9 webpack && pkill -9 nohup && pkill -9 wdio && pkill -9 BrowserStackLocal'
alias lsa='ls -lah'
alias ping='prettyping'
alias profile='vim ~/.zshrc'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias reload='source ~/.zshrc'
alias twitter='rainbowstream'
alias upstream='tmux attach-session -t upstream'
alias vpn-connect='expressvpn connect'
alias vpn-disconnect='expressvpn disconnect'
alias vpn='expressvpn status'
alias weather='http wttr.in/94107'
alias wget='http -d'
alias wip='git add -A && git cam "WIP"'
alias wipu='git reset HEAD~'
alias yarnc='echo "=> Deleting node_modules" && rm -rf node_modules && yarn'

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
alias board='jira issue ls'
alias wikia-deploy='ssh jrogan@deploy-s1'
alias wikia-push='rsync -av --delete --progress /Users/joshrogan/projects/wikia/ jrogan@dev-jrogan:/usr/wikia/source/app/'
alias wikia-assets='rsync -av --delete --progress /Users/joshrogan/projects/dev-assets/ jrogan@dev-jrogan:~/dev-assets'
alias wikia-upload='rsync -av --delete --progress . jrogan@dev-jrogan:~/dev-assets/dirs/'
alias wikia='ssh jrogan@dev-jrogan-18'
alias wikia-dev-key="curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'username=jrogan92&password=570309118Five' 'https://services.wikia-dev.us/auth/token'"
alias wikia-ucp-pull="rsync -avzhe ssh jrogan@dev-jrogan-18:~/unified-platform/ ~/projects/unified-platform/  --exclude '.idea'"
alias wikia-ucp-push="rsync -avzhe ssh ~/projects/unified-platform/extensions/ jrogan@dev-jrogan-18:~/unified-platform/extensions/"

wikia-ucp-dev() {
    fswatch -0 ~/projects/unified-platform/ | xargs -0 -I {} rsync -avzhe ssh ~/projects/unified-platform/extensions/ jrogan@dev-jrogan-18:~/unified-platform/extensions/
}


# Get fastly debug headers
wikia-header() {
    httpstat "${1}" -H 'Fastly-Debug: 1'
}

# Open a jira issue
issue() {
    jira issue "CAKE-${1}"
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

osis Linux && {
  alias wikia-vpn='sudo openvpn --config ~/projects/vpn-stuff/openvpn '
  alias wikia-vpn-routes='sudo route add 10.8.68.166 dev tun0 || sudo route add 10.8.76.24 dev tun0 || sudo route add 10.8.40.111 dev tun0 || sudo route add 10.8.44.90 dev tun0'
  alias wikia-vpn-off='sudo cp ~/resolv.conf.deafult /etc/resolv.conf'
  alias wikia-vpn-on='sudo cp ~/resolv.conf.wikia /etc/resolv.conf'
}

#which -s hub && {
#    alias git=hub
#    alias issues="git browse -- issues"
#}
################################# ALIASES #################################

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
# [[ -f /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh
source ~/projects/nerd-fonts/bin/scripts/lib/i_oct.sh

echo $i_oct_heart
