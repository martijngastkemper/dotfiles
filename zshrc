export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add sbin for Composer
export PATH=/usr/local/sbin:$PATH

# Make Brew ruby available
export PATH=/usr/local/opt/ruby/bin:$PATH

# Make Brew mysql-client available
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"

# Make dotfile utility scripts available
export PATH="$HOME/.dotfiles/bin:$PATH"

# Make yarn and yarn global available
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# PHP Composer configuration
export COMPOSER_HOME=~/.composer
export PATH=$COMPOSER_HOME/vendor/bin:$PATH

# Hide username from statusline
export DEFAULT_USER=`whoami`

# Activate Antigen - ZSH plugin manager
source ~/.dotfiles/bin/antigen.zsh

antigen use oh-my-zsh
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle lukechilds/zsh-nvm
antigen bundle pj
if command -v tmux > /dev/null ; then
    antigen bundle tmux
fi
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme agnoster

antigen apply

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Give Fish like suggestions a color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

export EDITOR='vim'

# SSH
export SSH_KEY_PATH=~/.ssh/id_rsa

if [ -f $SSH_KEY_PATH ]; then
    ssh-add -K $SSH_KEY_PATH > /dev/null 2>&1
else
    echo "Add private and public key to $SSH_KEY_PATH and $SSH_KEY_PATH.pub"
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias dstats="docker stats"
alias gl="git pull --rebase"
alias gstl="git stash list --format='%gd (%cr): %gs'"
alias dcr="docker-compose run --rm"

function fixup () {
    git commit --fixup=${1:-`git rev-parse HEAD`}
}

function idea() {
    open -na "PhpStorm.app" --args "$1:A"
}

# Configure pj (project jump) plugin
export PROJECT_PATHS=(~/Sites)

# When .zshrc.local exists load it to make device specific settings available
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

