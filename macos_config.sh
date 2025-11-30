#!/usr/bin/env sh

set -e

# Close System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Become root
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# #################################################################################
# General UI/UX
# #################################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

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
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 3
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# #################################################################################
# Keyboard
# #################################################################################

# Increase cursor speed
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

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

if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    echo "iTerm profile has been changes, restart iTerm"
else
    apps="$apps iTerm2"
fi

for app in $apps; do
    killall "${app}" > /dev/null 2>&1
done

echo "Logout and login to apply all changes!"
