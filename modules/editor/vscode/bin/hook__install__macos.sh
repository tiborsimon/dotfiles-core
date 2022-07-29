#!/bin/sh

dm__logger__task 'Tweaking key repeat settings..'

# As it was recommended: https://github.com/VSCodeVim/Vim#mac
dm__execute defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

dm__logger__separator
dm__logger__success "Done!"
