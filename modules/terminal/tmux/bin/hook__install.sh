#!/bin/sh

dm__logger__task 'Installing the python module..'
dm__logger__separator

TMUX_PLUGINS_DIR="${HOME}/.config/tmux/plugins"

dm__logger__info 'Installing the Tmux Plugin Manager..'
dm__logger__separator
dm__execute posix_adapter__mkdir --parents "$TMUX_PLUGINS_DIR"
dm__execute git clone https://github.com/tmux-plugins/tpm "${TMUX_PLUGINS_DIR}/tpm"
dm__logger__separator

dm__logger__success "Done!"
