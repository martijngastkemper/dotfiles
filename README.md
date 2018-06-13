# Dotfiles

My workspace!

Inspired by [harmenjanssen/dotfiles](https://github.com/harmenjanssen/dotfiles) and [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## Install dotfiles and Brew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    git clone git://github.com/martijngastkemper/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    brew bundle install
    node install.js

## Vundle 

My Vim setup uses Vundle, so grab that separately:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

And run `:VundleInstall` from Vim.

## Override Zsh settings

To load settings to Zsh which aren't global add them to:

    vim ~/.zshrc.local
