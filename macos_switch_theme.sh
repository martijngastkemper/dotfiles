#!/bin/sh

if defaults read 'Apple Global Domain' AppleInterfaceStyle >/dev/null 2>&1; then
  ~/.dotfiles/bin/dark
else
  ~/.dotfiles/bin/light
fi
