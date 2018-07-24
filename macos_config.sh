#!/usr/bin/env bash

# cherry-picked from https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# #################################################################################
# Dock / Dashboard
# #################################################################################

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# #################################################################################
# Trackpad
# #################################################################################

# Increase tracking speed
defaults write -g com.apple.trackpad.scaling 2

# #################################################################################
# Keyboard 
# #################################################################################

# Increase cursor speed
defaults write -g KeyRepeat 2
defaults write -g InitialKeyRepeat 15

# #################################################################################
# Date/time
# #################################################################################

# Change date time appearance in menu bar
defaults write com.apple.menuextra.clock DateFormat "d MMM  HH:mm:ss"

# #################################################################################
# iTerm2
# #################################################################################

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string ~/.dotfiles/iterm2

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

apps="Dock SystemUIServer"

if [ "$TERM_PROGRAM" == 'iTerm.app' ]; then
    echo "iTerm profile has been changes, restart iTerm"
else
    apps="$apps iTerm2"
fi

for app in $apps; do
    killall "${app}" > /dev/null 2>&1
done

