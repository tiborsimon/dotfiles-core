#!/bin/sh

dm__logger__task 'Tweaking key repeat settings..'

# https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x/83923#83923
dm__execute defaults write -g InitialKeyRepeat -int 11 # normal minimum is 15 (225 ms)
dm__execute defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

dm__logger__separator
dm__logger__success "Done!"
