#!/bin/sh

dm__logger__task 'Tapping the mandatory taps..'
dm__logger__separator
dm__execute brew tap homebrew/cask
dm__execute brew tap homebrew/cask-fonts
dm__logger__separator

dm__logger__success "Done!"
