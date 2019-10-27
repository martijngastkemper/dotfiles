export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

# Add sbin for Composer
export PATH=/usr/local/sbin:$PATH

# Make Brew Ruby available
export PATH=/usr/local/opt/ruby/bin:$PATH

# Make dotfile utility scripts available
export PATH=~/.dotfiles/bin:$PATH

# Add PHP to PATH
export PATH="/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:/usr/local/opt/php@7.2/sbin:$PATH"

# Hide username from statusline
export DEFAULT_USER=`whoami`

#Activate Antigen - ZSH plugin manager
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle composer
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle lukechilds/zsh-nvm
antigen bundle pj
antigen bundle tmux
antigen bundle yarn
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme agnoster

antigen apply

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
ENABLE_CORRECTION="true"

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

# zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

export EDITOR='vim'

# PHP Composer
export COMPOSER_HOME=~/.composer

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
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias zshconfig="$EDITOR ~/.zshrc.local"

function fixup () {
    git commit --fixup=${1:-`git rev-parse HEAD`}
}

# Configure pj (project jump) plugin
export PROJECT_PATHS=(~/Sites)

# When .zshrc.local exists load it to make device specific settings available 
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
