#!/bin/sh

dm__logger__task 'Installing the python module..'
dm__logger__separator

dm__logger__info 'Installing pipx..'
dm__logger__separator
dm__execute python -m pip install --user pipx
dm__logger__separator

dm__logger__info 'Installing and configuring virtualfish..'
dm__logger__separator
dm__execute pipx install virtualfish
dm__execute vf install
dm__logger__separator

dm__logger__success "Done!"
