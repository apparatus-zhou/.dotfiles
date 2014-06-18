# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -f $DOTFILES/.bash_aliases ]; then
    source $DOTFILES/.bash_aliases
fi

if [ -f $DOTFILES/zsh/activate.sh ]; then
    source $DOTFILES/zsh/activate.sh
fi

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


##########
# virtualenv related
##########

if which virtualenvwrapper.sh 1>/dev/null; then
    source virtualenvwrapper.sh

    # Load virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/workspace

    # make pip use the same directory for virtualenvs as virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
fi

# auto verify add config git user name and email
function git_user_verify() {
    if [[ -d ".git" ]]; then
        if ! git config --get user.name 1>/dev/null; then
            echo -n "Git user.name not configured, please enter your name: "
            read name
            if [[ -n $name ]]; then
                git config user.name $name
            else
                echo "name empty, not configured."
            fi
        fi

        if ! git config --get user.email 1>/dev/null; then
            echo -n "Git user.email not configured, please enter your email: "
            read email
            if [[ -n $email ]]; then
                git config user.email $email
            else
                echo "email empty, not configured."
            fi
        fi
    fi
}

# define auto_virtualenv to make autoenv better for virtualenv
# function autoenv_virtualenv() {
    # typeset venv
    # venv="$1"
    # if [[ -n "$VIRTUAL_ENV" ]]; then
        # source "$VIRTUAL_ENV/bin/activate"
    # fi
    # if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
        # # verify virtualenvwrapper installed
        # if which virtualenvwrapper.sh 1>/dev/null; then
            # source virtualenvwrapper.sh
        # else
            # echo "ERROR: virtualenvwrapper not installed."
            # exit $?
        # fi

        # # activate or create virtualenv
        # if workon | grep -q "^$1$"; then
            # workon $1
        # else
            # echo -n "$1 doesn't exist, creat now? [y/N] "
            # read answer
            # if [[ "$answer" == "y" ]]; then
                # mkvirtualenv $1
                # if [[ -e "requirements.txt" ]]; then
                    # pip install -U -r requirements.txt
                # fi
            # fi
        # fi
    # fi
# }

function cd() {
    if builtin cd "$@"; then
        autoenv_init
        git_user_verify
    else
        return $?
    fi
}
