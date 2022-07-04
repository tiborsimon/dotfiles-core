#!/bin/sh

TARGET_FILE='./config/generated/abbreviation_script.fish'
posix_adapter__mkdir --parents "$(posix_adapter__dirname "$TARGET_FILE")"
posix_adapter__rm --force "$TARGET_FILE"

dm__logger__task "Generating alias script at ${UNDERLINE}${TARGET_FILE}${RESET}.."
dm__logger__separator

echo "# Abbreviation script generated at $(date)" >> "$TARGET_FILE"
echo '' >> "$TARGET_FILE"
echo "# Collected abbreviations:" >> "$TARGET_FILE"

dm__get_variable 'ALIAS' | while read -r alias_string
do
  word="$( \
    echo "$alias_string" | \
    posix_adapter__cut --delimiter '=' --fields 1 \
  )"
  expansion="$( \
    echo "$alias_string" | \
    posix_adapter__cut --delimiter '=' --fields 2 \
  )"
  abbreviation="$( \
    echo "abbr --add '${word}' '${expansion}'" | \
    posix_adapter__tr --squeeze-repeats "'" \
  )"
  echo "$abbreviation" >> "$TARGET_FILE"

  dm__logger__log "$abbreviation"
done

dm__logger__separator
dm__logger__success "Done!"
