# Dotfiles

My workspace!

Inspired by [harmenjanssen/dotfiles](https://github.com/harmenjanssen/dotfiles), [jackfranklin/dotfiles](https://github.com/jackfranklin/dotfiles) and [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## Installation

### Step 1: Dotfiles

    git clone git://github.com/martijngastkemper/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    make symlinks

### Step 2: Brew

    make install_brew
    make install_brew_packages

### Step 3: ZSH

    make configure_zsh

### Step 4: Vundle

    make install_vim_bundle

### Step 5: Configure MacOS

    make configure_macos

Settings to change manually

*Let Caps Lock be an Escape key*  
System Preferences -> Keyboard -> Modifier Keys -> Caps Lock -> Esc 

*Lock computer immediately*  
System Preferences -> Security & Privacy -> General -> Require password ...

## Override Zsh settings

To load settings to Zsh which aren't global add them to:

    vim ~/.zshrc.local

## Find domain and key for usage in ``defaults``

It's hard to find the right domaian and key of a preference. To find it use ``diff``

    defaults read > before
    # make the desired changes to your preferences
    defaults read > after
    diff before after
