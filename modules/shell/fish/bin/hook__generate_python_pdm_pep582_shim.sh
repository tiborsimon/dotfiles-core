#!/bin/sh

TARGET_FILE='./config/generated/python_pdm_pep582.fish'
posix_adapter__mkdir --parents "$(posix_adapter__dirname "$TARGET_FILE")"
posix_adapter__rm --force "$TARGET_FILE"

dm__logger__task "Generating python PDM PEP582 shim file at ${UNDERLINE}${TARGET_FILE}${RESET}.."

pdm --pep582 fish >> "$TARGET_FILE"

dm__logger__separator

dm__logger__success 'Done!'
