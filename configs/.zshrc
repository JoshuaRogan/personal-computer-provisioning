#!/usr/bin/env bash

# zmodload zsh/zprof

# Must Install List
# diff2Html
# has - https://github.com/kdabir/has

# Brew Installs
# brew install bandwhich -- monitor bandwith by process
# brew install yank

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
SCRIPTS_DIR="${PROJECTS_DIR}personal-computer-provisioning/scripts/"
FANDOM_SCRIPTS_DIR="${SCRIPTS_DIR}/fandom/"
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
  alias screensaver='open -b com.apple.ScreenSaver.Engine'
}

########### Dev Box Only ###########
if [[ $(whoami) = "jrogan" ]];
then
  echo "Devbox"
  export VAULT_ADDR=https://active.vault.service.sjc.consul:8200
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
alias chrome='google-chrome'
alias clean='sudo pkill -9 php && sudo pkill -9 node && sudo pkill -9 npm && killnode'
alias clock='npx cli-clock'
alias ldot='ls -d .*'
alias killnode='echo "=> Killing nodejs and webpack" && pkill -9 node && pkill -9 webpack-serve && pkill -9 webpack && pkill -9 nohup && pkill -9 wdio && pkill -9 BrowserStackLocal'
alias lsa='ls -lah'
alias profile='vim ~/.zshrc'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias reload='source ~/.zshrc'
alias twitter='rainbowstream'
alias weather='http wttr.in/18504'
alias wip='git add -A && git cam "WIP"'
alias wipu='git reset HEAD~'
alias yarnc='echo "=> Deleting node_modules" && rm -rf node_modules && yarn'

########### CONDITIONAL ALIASES ########## (MUST INSTALL)
which -s bat 1> /dev/null && alias cat='bat'
which -s prettyping 1> /dev/null && alias ping='prettyping'
which -s http 1> /dev/null alias wget='http -d'

########## APPLICATION OPEN ##########
alias intellij='open -a "IntelliJ IDEA 3"'
alias vscode='open -a "Visual Studio Code"'

########## INTELLI OPENS ##########
alias f2="intellij ${PROJECTS_DIR}f2"
alias pandora="intellij ${PROJECTS_DIR}pandora"
alias personal="intellij ${PROVISION_DIR}"
alias react-common="intellij ${PROJECTS_DIR}react-common"
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
alias fandom-kube-prod='fandom-kube-prod-sjc'
alias fandom-kube-prod-sjc='kubectl --context kube-sjc-prod --namespace prod'
alias fandom-kube-prod-res='kubectl --context kube-res-prod --namespace prod'
alias fandom-kube-dev='fandom-kube-dev-sjc'
alias fandom-kube-dev-sjc='kubectl --context kube-res-prod --namespace dev'
alias fandom-kube-dev-res='kubectl --context kube-res-prod --namespace res'
alias scripts-fandom-purge="bash ${FANDOM_SCRIPTS_DIR}purger.sh"

# Get fastly debug headers
fandom-header() {
    httpstat "${1}" -H 'Fastly-Debug: 1'
}

fandom-purge() {
    curl -X POST ${1} -H "Fastly-Key: 2c2455e5db4f7e59af3e5f642392d5da"
}

# Send an internal post request
fandom-internal-post-req() {
  http --proxy http://border.service.consul:80 POST ${1} X-Wikia-Internal-Request:1
}

# send an internal get request
fandom-internal-get-req() {
  http --proxy http://border.service.consul:80 GET ${1} X-Wikia-Internal-Request:1
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

export GITHUB_TOKEN=7630d6751b47e7cb272b43bc64ffecb6dae750b6
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshrogan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joshrogan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshrogan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joshrogan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
