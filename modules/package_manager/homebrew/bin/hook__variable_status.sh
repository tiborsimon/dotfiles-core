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
# CONSTANTS
#==============================================================================

VARIABLE_STATUS_CACHE_FILE="${cache_root_path}/variable_status__homebrew.tmp"

#==============================================================================
# PREPARE MODE
#==============================================================================

if [ "$execution_mode" = "prepare" ]
then
  if [ ! -f "$VARIABLE_STATUS_CACHE_FILE" ]
  then
    brew list --version > "$VARIABLE_STATUS_CACHE_FILE"
  fi
  exit 0
fi

#==============================================================================
# EXECUTE MODE
#==============================================================================

if [ -f "$VARIABLE_STATUS_CACHE_FILE" ]
then
  result="$(grep -E "${variable_value}\s" "$VARIABLE_STATUS_CACHE_FILE")"
  if [ "$?" -ne 0 ]
  then
    exit 1
  fi
  echo "$result" | cut -d ' ' -f 2
else
  echo "Cache file is missing: '${VARIABLE_STATUS_CACHE_FILE}'"
  exit 1
fi
