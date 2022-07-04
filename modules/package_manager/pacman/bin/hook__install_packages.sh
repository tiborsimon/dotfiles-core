#!/bin/sh

dm__logger__task "Installing collected packages with pacman.."

packages="$(dm__get_variable 'PACMAN' | posix_adapter__xargs)"

dm__execute_with_privilege pacman -S --noconfirm --needed $packages

dm__logger__success "Done!"

