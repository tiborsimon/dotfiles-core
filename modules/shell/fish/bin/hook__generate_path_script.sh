#!/bin/sh

TARGET_FILE='./config/generated/path_script.fish'
posix_adapter__mkdir --parents "$(posix_adapter__dirname "$TARGET_FILE")"
posix_adapter__rm --force "$TARGET_FILE"

dm__logger__task "Generating path file at ${UNDERLINE}${TARGET_FILE}${RESET}.."
dm__logger__separator

echo "# Path script generated at $(date)" >> "$TARGET_FILE"
echo '' >> "$TARGET_FILE"
echo "# Deleting the global path prefix variable.." >> "$TARGET_FILE"
echo "set --erase --global fish_user_paths" >> "$TARGET_FILE"

echo '' >> "$TARGET_FILE"
echo "# Collected PATH entries:" >> "$TARGET_FILE"

dm__get_variable 'PATH' | while read -r path_entry
do
  home_value="$HOME"
  resolved_path_entry="$( \
    echo "$path_entry" | \
    posix_adapter__sed --expression "s#\$HOME#${home_value}#" \
  )"
  entry="set --global fish_user_paths \$fish_user_paths ${resolved_path_entry}"
  echo "$entry" >> "$TARGET_FILE"
  dm__logger__log "$entry"
done

dm__logger__separator

dm__logger__success 'Done!'
