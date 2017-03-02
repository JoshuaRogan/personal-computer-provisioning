#!/usr/bin/env bash
# Path to your oh-my-zsh installation.
USE_PRESTO=true
USE_OHMYZSH=false
PROVISION_DIR="${HOME}/projects/personal-computer-provisioning/"
PROVISION_CONFIG_DIR="${PROVISION_DIR}/configs"

################################# GREETING #################################
function welcome(){
    cowsay -p -f stegosaurus "Welcome $(whoami)"
    fortune -io
}
welcome
################################# GREETING #################################

################################# Prezto #################################
if [ "$USE_PRESTO" = true ] ; then
#    echo "Using prezto"

    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    # Customize to your needs...
    . "${PROVISION_CONFIG_DIR}/z.sh"
fi


################################# Oh My ZSH #################################
if [ "$USE_OHMYZSH" = true ] ; then
#    echo "Using oh-my-zsh"
    export ZSH=~/.oh-my-zsh
    ZSH_THEME="theunraveler"
    source $ZSH/oh-my-zsh.sh

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"
    plugins=(nvm git bundler osx command-not-found Composer common-aliases npm pip vagrant sudo gulp z sublime yeoman extract h httpie laravel5)

    # Uncomment the following line to use case-sensitive completion.
    # CASE_SENSITIVE="true"

    # Uncomment the following line to use hyphen-insensitive completion. Case
    # sensitive completion must be off. _ and - will be interchangeable.
    # HYPHEN_INSENSITIVE="true"

    # Uncomment the following line to disable bi-weekly auto-update checks.
    # DISABLE_AUTO_UPDATE="true"

    # Uncomment the following line to change how often to auto-update (in days).
    # export UPDATE_ZSH_DAYS=13

    # Uncomment the following line to disable colors in ls.
    # DISABLE_LS_COLORS="true"

    # Uncomment the following line to disable auto-setting terminal title.
    # DISABLE_AUTO_TITLE="true"

    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"



    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    # DISABLE_UNTRACKED_FILES_DIRTY="true"

    # Uncomment the following line if you want to change the command execution time
    # stamp shown in the history command output.
    # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    # HIST_STAMPS="mm/dd/yyyy"

    # Would you like to use another custom folder than $ZSH/custom?
    # ZSH_CUSTOM=/path/to/new-custom-folder

    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.

    # User configuration

    # export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
    # export MANPATH="/usr/local/man:$MANPATH"



    # You may need to manually set your language environment
    # export LANG=en_US.UTF-8

    # Preferred editor for local and remote sessions
    # if [[ -n $SSH_CONNECTION ]]; then
    #   export EDITOR='vim'
    # else
    #   export EDITOR='mvim'
    # fi

    # Compilation flags
    # export ARCHFLAGS="-arch x86_64"

    # ssh
    # export SSH_KEY_PATH="~/.ssh/dsa_id"

    # Set personal aliases, overriding those provided by oh-my-zsh libs,
    # plugins, and themes. Aliases can be placed here, though oh-my-zsh
    # users are encouraged to define aliases within the ZSH_CUSTOM folder.
    # For a full list of active aliases, run `alias`.
    #
    # Example aliases
    # alias zshconfig="mate ~/.zshrc"
    # alias ohmyzsh="mate ~/.oh-my-zsh"
fi


################################# Misc #################################
########### Exports ###########
export EDITOR=vim
export PATH=${PATH}:/usr/local/opt/gettext/bin
export PATH=${PATH}:~/go/bin
export GOPATH=~/go
export NVM_DIR="/Users/joshrogan/.nvm"


#fpath=(/usr/local/share/zsh-completions $fpath)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval $(thefuck --alias)



[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh


################################# ALIASES #################################
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias lsa='ls -lah'
alias ldot='ls -d .*'
alias mamp_php='less +F -R /Applications/MAMP/logs/php_error.log'
alias mamp_php='tail -f /Applications/MAMP/logs/php_error.log'
alias valet_log='tail -f /usr/local/var/log/valet.log'
alias valet_queued_log='lnav /usr/local/var/log/valet.log.queue.log'

####### Wikia #######
alias wikia-push='rsync -av --delete --progress /Users/joshrogan/projects/wikia/ jrogan@dev-jrogan:/usr/wikia/source/app/'
alias wikia='ssh jrogan@dev-jrogan'
alias wikia-deploy='ssh jrogan@deploy-s1'
alias reload='source ~/.zshrc'
alias profile='vim ~/.zshrc'
alias gpo='git pull origin'
alias composer='php -n /usr/local/bin/composer'

########### CURL STUFF ###########
alias http='time http'
alias header='httpstat'
alias search='ag'

########### Git STUFF ###########
function gitpush {
    git push origin HEAD
}

function gitpull {
    git pull origin master --no-rebase 2> /dev/null
    git pull origin dev --no-rebase 2> /dev/null
}

########### SSH STUFF ###########
alias droplet-root='ssh root@droplet.joshuarogan.com'
alias droplet-josh='ssh josh@droplet.joshuarogan.com'
alias droplet='droplet-josh'
################################# ALIASES #################################
