#!/bin/bash

# Problem:
# The icons on the menu bar are quite spaced out by default. Once you have a
# few of them, applications that need a bit of extra space, such as system
# monitors or stock tickers might not be able to display properly for lack of
# space.
#
# Solution:
# Fortunately you can change the spacing by setting globalDomain system properties.
#
# See:
# https://apple.stackexchange.com/questions/406316/can-the-spacing-of-menu-bar-apps-be-modified-in-macos-big-sur-and-later

defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6

# Use the following to return to the default:
# defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
# defaults -currentHost delete -globalDomain NSStatusItemSpacing
