BASEDIR="$HOME/.dotfiles"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add sbin for Composer
export PATH=/usr/local/sbin:$PATH

# Make dotfile binaries available
export PATH="$BASEDIR/bin:$PATH"

# PHP Composer configuration
export COMPOSER_MEMORY_LIMIT=-1
export COMPOSER_HOME=~/.composer
export PATH=$COMPOSER_HOME/vendor/bin:$PATH

# Hide username from statusline
export DEFAULT_USER=`whoami`

# Activate Antigen - ZSH plugin manager
source $BASEDIR/bin/antigen.zsh

antigen use oh-my-zsh
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

alias artisan="php artisan"
alias gb="git branch --sort=committerdate"
alias gl="git pull --rebase"
alias gstpa="git stash --patch"
alias gstl="git stash list --format='%gd (%cr): %gs'"
alias php74="brew unlink php@8.0 php@8.1 php@8.2 php@8.3 php@8.4 php && brew link php@7.4"
alias php80="brew unlink php@7.4 php@8.1 php@8.2 php@8.3 php@8.4 php && brew link php@8.0"
alias php81="brew unlink php@7.4 php@8.0 php@8.2 php@8.3 php@8.4 php && brew link php@8.1"
alias php82="brew unlink php@7.4 php@8.0 php@8.1 php@8.3 php@8.4 php && brew link php@8.2"
alias php83="brew unlink php@7.4 php@8.0 php@8.1 php@8.2 php@8.4 php && brew link php@8.3"
alias php84="brew unlink php@7.4 php@8.0 php@8.1 php@8.2 php@8.3 php && brew link php@8.4"
alias php85="brew unlink php@7.4 php@8.0 php@8.1 php@8.2 php@8.3 php@8.4 && brew link php"
alias tf="terraform"
alias tfi="terraform import"
alias tfa="terraform fmt; terraform apply"
alias tfp="terraform fmt; terraform plan"
alias disable_xdebug74="mv `brew --prefix`/etc/php/7.4/conf.d/ext-xdebug.ini `brew --prefix`/etc/php/7.4/conf.d/ext-xdebug.ini.disabled"
alias disable_xdebug80="mv `brew --prefix`/etc/php/8.0/conf.d/ext-xdebug.ini `brew --prefix`/etc/php/8.0/conf.d/ext-xdebug.ini.disabled"
alias disable_xdebug81="mv `brew --prefix`/etc/php/8.1/conf.d/ext-xdebug.ini `brew --prefix`/etc/php/8.1/conf.d/ext-xdebug.ini.disabled"
alias enable_xdebug74="mv `brew --prefix`/etc/php/7.4/conf.d/ext-xdebug.ini.disabled `brew --prefix`/etc/php/7.4/conf.d/ext-xdebug.ini"
alias enable_xdebug80="mv `brew --prefix`/etc/php/8.0/conf.d/ext-xdebug.ini.disabled `brew --prefix`/etc/php/8.0/conf.d/ext-xdebug.ini"
alias enable_xdebug81="mv `brew --prefix`/etc/php/8.1/conf.d/ext-xdebug.ini.disabled `brew --prefix`/etc/php/8.1/conf.d/ext-xdebug.ini"

source $BASEDIR/fixup.zsh
unalias gcm 2>/dev/null
source $BASEDIR/gcm.zsh
source $BASEDIR/idea.zsh

# Configure pj (project jump) plugin
export PROJECT_PATHS=(~/Sites)

export VAGRANT_CWD=~/Homestead
alias homestead=vagrant

# When .zshrc.local exists load it to make device specific settings available
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
