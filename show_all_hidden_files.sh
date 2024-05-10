#!/bin/bash

# Problem:
# By default when your run 'Finder' you can't see any hidden files. Both files
# that have been explicitly hidden and also those that filenames that start
# with a period. This is very annoying if you want to in fact just see hidden
# files all the time always.
#
# Solution:
# Set the flag that will make finder show all files.

defaults write com.apple.finder AppleShowAllFiles -bool true

# Restart Finder if necessary:
# killall Finder
