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

## Find domain and key for usage in ``defaults``

It's hard to find the right domaian and key of a preference. To find it use ``diff``

    defaults read > before
    # make the desired changes to your preferences
    defaults read > after
    diff before after

## Settings to change manually or implement later on

*Let Caps Lock be an Escape key*  
System Preferences -> Keyboard -> Modifier Keys -> Caps Lock -> Esc 

*Lock computer immediately*  
System Preferences -> Security & Privacy -> General -> Require password ...
