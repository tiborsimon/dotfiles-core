#!/bin/sh

#==============================================================================
# FORMULAE
#==============================================================================

formulae="$(dm__get_variable 'FORMULAE')"

dm__logger__task "Installing collected formulae with homebrew:"
dm__logger__separator
echo "$formulae" | dm__logger__prefix_lines
dm__logger__separator
dm__logger__user_input "Do you want to continue? [y|N]"
dm__logger__separator

if [ 'y' = "$dm_user_response" ]
then
  # No wrapping quotes as we do want to have re-splitting here..
  dm__execute brew install $(echo "$formulae" | posix_adapter__xargs)
  dm__logger__separator
  dm__logger__success "Formulae were installed!"
else
  dm__logger__warning "${YELLOW}Aborted by user..${RESET}"
  dm__logger__footer
fi

#==============================================================================
# CASKS
#==============================================================================

casks="$(dm__get_variable 'CASKS')"

dm__logger__task "Installing collected casks with homebrew:"
dm__logger__separator
echo "$casks" | dm__logger__prefix_lines
dm__logger__separator
dm__logger__user_input "Do you want to continue? [y|N]"
dm__logger__separator

if [ 'y' = "$dm_user_response" ]
then
  # No wrapping quotes as we do want to have re-splitting here..
  dm__execute brew install --cask $(echo "$casks" | posix_adapter__xargs)
  dm__logger__separator
  dm__logger__success "Casks were installed!"
else
  dm__logger__warning "${YELLOW}Aborted by user..${RESET}"
  dm__logger__footer
  exit 1
fi
