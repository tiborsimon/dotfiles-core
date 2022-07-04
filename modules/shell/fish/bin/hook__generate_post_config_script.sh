#!/bin/sh

TARGET_FILE='./config/generated/post_config_script.fish'
posix_adapter__mkdir --parents "$(posix_adapter__dirname "$TARGET_FILE")"
posix_adapter__rm --force "$TARGET_FILE"

dm__logger__task "Generating post config file at ${UNDERLINE}${TARGET_FILE}${RESET}.."
dm__logger__separator

echo "# Post config script generated at $(date)" >> "$TARGET_FILE"
echo '' >> "$TARGET_FILE"

echo '' >> "$TARGET_FILE"
echo "# Collected post config commands:" >> "$TARGET_FILE"

dm__get_variable 'POST_CONFIG' | while read -r post_config_command
do
  echo "$post_config_command" >> "$TARGET_FILE"
  dm__logger__log "$post_config_command"
done

dm__logger__separator

dm__logger__success 'Done!'
