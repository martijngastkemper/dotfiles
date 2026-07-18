#!/usr/bin/env sh
# shellcheck source=/dev/null

export LC_ALL=en_GB.utf8
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Make dotfile binaries available
export PATH="$HOME/.dotfiles/bin:$PATH"

# Make Go binaries available
GO_BIN_PATH="$(go env GOPATH)/bin"
export PATH="$GO_BIN_PATH:$PATH"
