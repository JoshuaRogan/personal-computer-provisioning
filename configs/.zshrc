# Path to your oh-my-zsh installation.
USE_PRESTO=true
USE_OHMYZSH=false

fpath=(/usr/local/share/zsh-completions $fpath)


################################# ALIASES #################################
eval $(thefuck --alias)
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
export PATH=${PATH}:/usr/local/opt/gettext/bin
alias lsa='ls -lah'

export NVM_DIR="/Users/joshrogan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias mamp_php='less +F -R /Applications/MAMP/logs/php_error.log'
alias mamp_php='tail -f /Applications/MAMP/logs/php_error.log'
alias valet_log='tail -f /usr/local/var/log/valet.log'
#alias valet_log='tail -n 50 -f /usr/local/var/log/valet.log | grep --color "START"'
#alias valet_log='lnav /usr/local/var/log/valet.log'
alias valet_queued_log='lnav /usr/local/var/log/valet.log.queue.log'


alias wikia-push='rsync -av --delete --progress /Users/joshrogan/projects/wikia/ jrogan@dev-jrogan:/usr/wikia/source/app/'
alias wikia='ssh jrogan@dev-jrogan'
alias wikia-deploy='ssh jrogan@deploy-s1'
alias reload='source ~/.zshrc'
alias profile='vim ~/.zshrc'
alias gpo='git pull origin'
alias composer='php -n /usr/local/bin/composer'

function gitpush {
	git push origin HEAD
}

# CURL Helpers
alias http='time http'
alias header='httpstat'
alias search='ag'

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/joshrogan/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

#alias make='make -f Makefile.custom'
#alias maked='make -f Makefile'

########### SSH STUFF ###########
alias droplet-root='ssh root@droplet.joshuarogan.com'
alias droplet-josh='ssh josh@droplet.joshuarogan.com'
alias droplet='droplet-josh'
################################# ALIASES #################################



# Source Prezto..zshrc
if [ "$USE_PRESTO" = true ] ; then
    #PRESTO CONFIG
    echo "PRESTO"
    # Executes commands at the start of an interactive session.
    #
    # Authors:
    #   Sorin Ionescu <sorin.ionescu@gmail.com>
    #

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    # Customize to your needs...
    . /Users/joshrogan/.oh-my-zsh/plugins/z/z.sh
fi

if [ "$USE_OHMYZSH" = true ] ; then
    #OHMYZSH CONFIG
    echo "OH-MY"
    export ZSH=~/.oh-my-zsh

    # Set name of the theme to load.
    # Look in ~/.oh-my-zsh/themes/
    # Optionally, if you set this to "random", it'll load a random theme each
    # time that oh-my-zsh is loaded.
    ZSH_THEME="theunraveler"


    source $ZSH/oh-my-zsh.sh
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

    # Uncomment the following line to display red dots whilst waiting for completion.
     COMPLETION_WAITING_DOTS="true"

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
    plugins=(nvm git bundler osx command-not-found Composer common-aliases npm pip vagrant sudo gulp z sublime yeoman extract h httpie laravel5)

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

