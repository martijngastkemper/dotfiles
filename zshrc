BASEDIR="$HOME/.dotfiles"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add sbin for Composer
export PATH=/usr/local/sbin:$PATH

# Make dotfile binaries available
export PATH="$BASEDIR/bin:$PATH"

# Make bun binaries available
export PATH="$HOME/.bun/bin:$PATH"

# PHP Composer configuration
export COMPOSER_MEMORY_LIMIT=-1
export COMPOSER_HOME=~/.composer
export PATH=$COMPOSER_HOME/vendor/bin:$PATH

# Make Go binaries available
export PATH="`go env GOPATH`/bin:$PATH"

# Configure Brew
export HOMEBREW_BUNDLE_CASK_SKIP="docker-desktop elgato-control-center google-chrome ghostty signal whatsapp 1password 1password-cli" # Skip self updating apps
export HOMEBREW_BUNDLE_FILE=~/.dotfiles/Brewfile
export HOMEBREW_NO_ENV_HINTS=1
export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"

# Hide username from statusline
export DEFAULT_USER=`whoami`

# Activate Antigen - ZSH plugin manager
source $BASEDIR/bin/antigen.zsh

# Start tmux when a session starts
ZSH_TMUX_AUTOSTART=true

antigen use oh-my-zsh
antigen bundle git
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias artisan="php artisan"
alias cp="cp -i"
alias gl="git pull --rebase"
alias gstpa="git stash --patch"
alias gstl="git stash list --format='%gd (%cr): %gs'"
alias mv="mv -i"
alias tf="terraform"
alias tfi="terraform import"
alias tfa="terraform fmt; terraform apply"
alias tfp="terraform fmt; terraform plan"

source $BASEDIR/fixup.zsh
source $BASEDIR/gcm.zsh
source $BASEDIR/idea.zsh

export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}

export PYENV_ROOT="$HOME/.pyenv"
pyenv() {
  unset -f pyenv
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  pyenv "$@"
}
