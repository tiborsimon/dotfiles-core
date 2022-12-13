#!/bin/sh

TARGET_FILE='./config/generated/env_script.fish'
posix_adapter__mkdir --parents "$(posix_adapter__dirname "$TARGET_FILE")"
posix_adapter__rm --force "$TARGET_FILE"

# BUG: This UNDERLINE variable seems to be undefined when the terminal was incorrectly
# configured. It has to be assigned with an empty string if that capability is missing.
dm__logger__task "Generating env script at ${UNDERLINE}${TARGET_FILE}${RESET}.."
dm__logger__separator

echo "# Env script generated at $(date)" >> "$TARGET_FILE"
echo '' >> "$TARGET_FILE"
echo "# Collected environment variables:" >> "$TARGET_FILE"

dm__logger__info 'Collecting environment variables..'
dm__logger__separator

dm__get_variable 'ENV' | while read -r env_string
do
  home_value="$HOME"
  variable="$( \
    echo "$env_string" | \
    posix_adapter__cut --delimiter '=' --fields 1 \
  )"
  value="$( \
    echo "$env_string" | \
    posix_adapter__cut --delimiter '=' --fields 2 \
  )"
  resolved_value="$( \
    echo "$value" | \
    posix_adapter__sed --expression "s#\$HOME#${home_value}#" \
  )"
  definition="$( \
    echo "set --global --export '${variable}' '${resolved_value}'" | \
    posix_adapter__tr --squeeze-repeats "'" \
  )"
  echo "$definition" >> "$TARGET_FILE"

  dm__logger__log "$definition"
done

dm__logger__separator
dm__logger__success 'Done!'
