###############################################################################
## Path to your oh-my-zsh installation.
###############################################################################
export ZSH="/home/$(whoami)/.oh-my-zsh"

if [ $(whoami) = "root" ]; then
    export ZSH="/$(whoami)/.oh-my-zsh"
fi

source $ZSH/oh-my-zsh.sh


###############################################################################
## Set name of the theme to load.
###############################################################################
ZSH_THEME="adro"


###############################################################################
# Main Enviroment Path
###############################################################################
export PATH=$PATH:"/home/$(whoami)/setups/activator-dist-1.3.10/bin"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"

export ARCHFLAGS="-arch x86_64"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CFLAGS="-I/usr/local/opt/openssl/include"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


###############################################################################
# Red dots on waitign for completion
###############################################################################
COMPLETION_WAITING_DOTS="true"


###############################################################################
# History command output date format
###############################################################################
HIST_STAMPS="dd/mm/yyyy"


###############################################################################
# ZSH Plugins
# Example format: plugins=(rails git textmate ruby lighthouse)
###############################################################################
plugins=(git)



#==============================================================================
#=========================  USER CONFIGURATIONS  ==============================
#==============================================================================


###############################################################################
# NVM Path
###############################################################################
export NVM_DIR="/home/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


###############################################################################
# PyEnv autocomplete
###############################################################################
# To use Homebrews directories rather than ~/.pyenv add to your profile:
# export PYENV_ROOT=/usr/local/var/pyenv

# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# source /usr/local/bin/virtualenvwrapper.sh
# export WORKON_HOME=~/.virtualenvs


###############################################################################
# Environment Language
###############################################################################
export LANG="en_US.UTF-8"


###############################################################################
# Github info
###############################################################################
export GITHUB_USERNAME=""
export GITHUB_ACCESS_TOKEN=""


###############################################################################
# Fiddus Server Configurations
###############################################################################

# Amazon Access Key and Secret
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

# MailGun API Key
export MAILGUN_APIKEY=""


# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source $ZSH/oh-my-zsh.sh

###############################################################################
# Aliases
###############################################################################
alias tmux="tmux -2"
alias ta="tmux attach -t"
alias tnew="tmux new -s"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

alias pbcopy="xclip -selection clipboard"
alias bpaste="xclip -selection clipboard -o"

###############################################################################
# Source Bravi Aliases
###############################################################################
# source ~/alias.sh

###############################################################################
# Additional env paths
###############################################################################
export ENVS_PATH="/home/$(whoami)/.zshrc.envs"
[ -s "$ENVS_PATH" ] && . "$ENVS_PATH" # This loads nvm

