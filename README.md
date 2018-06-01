# Dotfiles

My workspace!

Inspired by [harmenjanssen/dotfiles](https://github.com/harmenjanssen/dotfiles) and [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## Install dotfiles

    git clone git://github.com/martijngastkemper/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    node install.js

## Install Brew dependencies

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle install

## Override Zsh settings

To load settings to Zsh which aren't global add them to:

    vim ~/.zshrc.local
