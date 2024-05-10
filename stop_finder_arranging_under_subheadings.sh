#!/bin/bash

# Problem:
# In Finder, the files are listed under stupid subheaders like Today, Yesterday,
# Previous 7 days etc.  This means if you want to sort by Size, you don't
# actually get all the largest files in the folder listed first in the view.
# 
# Solution:
# Remove the default preference to use subheaders
#
# See:
# https://apple.stackexchange.com/questions/19019/how-do-i-get-rid-of-the-sub-headings-in-finder-with-arrange-be-date-created-in

defaults write com.apple.finder FXPreferredGroupBy -string "None"

# Restart Finder if necessary:
# killall Finder

