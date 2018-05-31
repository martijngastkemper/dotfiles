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

for app in "Dock"; do
    killall "${app}" > /dev/null 2>&1
done

