#!/bin/sh

#==============================================================================
# SANE ENVIRONMENT
#==============================================================================

set -e  # exit on error
set -u  # prevent unset variable expansion

#==============================================================================
# ARGUMENT PARSING
#==============================================================================

execution_mode="$1"
variable_name="$2"
variable_value="$3"
cache_root_path="$4"

#==============================================================================
# PREPARE MODE
#==============================================================================

# There is no need to prepare for the variable status collection here.

#==============================================================================
# EXECUTE MODE
#==============================================================================

case "$variable_name" in
  'ALIAS')
    word="$( \
      echo "$variable_value" | \
      posix_adapter__cut --delimiter '=' --fields 1 \
    )"
    expansion="$( \
      echo "$variable_value" | \
      posix_adapter__cut --delimiter '=' --fields 2 \
    )"
    abbreviation="$( \
      echo "abbr --add '${word}' '${expansion}'" | \
      posix_adapter__tr --squeeze-repeats "'" \
    )"
    grep -q "$abbreviation" './config/generated/abbreviation_script.fish'
    exit 0
    ;;
  'ENV')
    home_value="$HOME"
    variable="$( \
      echo "$variable_value" | \
      posix_adapter__cut --delimiter '=' --fields 1 \
    )"
    value="$( \
      echo "$variable_value" | \
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
    grep -q "$definition" './config/generated/env_script.fish'
    exit 0
    ;;
  'PATH')
    home_value="$HOME"
    resolved_path_entry="$( \
      echo "$varaible_value" | \
      posix_adapter__sed --expression "s#\$HOME#${home_value}#" \
    )"
    entry="set --global fish_user_paths \$fish_user_paths ${resolved_path_entry}"
    grep -q "$entry" './config/generated/path_script.fish'
    exit 0
    ;;
  'POST_CONFIG')
    grep -q "$variable_value" './config/generated/post_config_script.fish'
    exit 0
    ;;
  *)
    exit 1
    ;;
esac
