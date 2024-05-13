#!/bin/bash

# Problem:
# By default, macOS Dock icons bounce to notify users of various events. This
# can be distracting and undesirable for users who prefer a more static and
# less intrusive interface.
#
# Solution:
# Disable the bouncing Dock icons feature to create a more steady and calm
# user experience.

# Set the Dock preference to stop icon bouncing
defaults write com.apple.dock no-bouncing -bool true

# Restart Dock to apply changes:
# killall Dock
