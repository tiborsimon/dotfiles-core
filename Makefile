#==============================================================================
# DOTMODULES USER CONFIGURATION PARAMETERS
#==============================================================================

# The dotmodules repository root path relative to this Makefile.
RELATIVE_DOTMODULES_REPO_ROOT_PATH := dm

# Your directory that contains the condiguration modules relative to the
# dotmodules repository root.
RELATIVE_MODULES_PATH := ../modules

# Configuration file name.
CONFIG_FILE_NAME := dm.toml

# Python interpreter to use when invoking the starting script.
PYTHON_INTERPRETER := python3

# Maximum line length after automatic wrapping will happen.
CLI__TEXT_WRAP_LIMIT := 110

# Indentation size in the interpreter as number of spaces.
CLI__INDENT := 2

# Indentation size in the interpreter as number of spaces.
CLI__COLUMN_PADDING := 2

# Prompt template that can be constructed from the following variables:
#   <<INDENT>>  - Indentation block you previously defined.
#   <<SPACE>>   - Single space character.
#   <<RESET>>   - Removes all formatting.
#   <<BOLD>>    - Format the text after it as bold.
#   <<DIM>>     - Format the text after it as muted.
#   <<RED>>     - Format the text after it as red.
#   <<GREEN>>   - Format the text after it as green.
#   <<YELLOW>>  - Format the text after it as yellow.
#   <<BLUE>>    - Format the text after it as blue.
#   <<MAGENTA>> - Format the text after it as magenta.
#   <<CYAN>>    - Format the text after it as cyan.
# Note that Makefile specific characters line dollar signs and hashmarks needs
# to be escaped in order to be assigned properly.
CLI__PROMPT_TEMPLATE := <<SPACE>><<BOLD>>dm<<RESET>><<SPACE>>\#<<SPACE>>

# Hotkey definitions for the cli as a pipe separated list.
CLI__HOTKEYS__EXIT      := q|quit|exit
CLI__HOTKEYS__HELP      := help
CLI__HOTKEYS__HOOKS     := h|hooks
CLI__HOTKEYS__MODULES   := m|modules
CLI__HOTKEYS__VARIABLES := v|variables

# Enables or disables the warning about too long documentation lines. If a line
# is too long it will be wrapped but that might not happen the way you want it.
WARNING__WRAPPED_DOCS := 1

#==============================================================================
#
#      DO NOT EDIT BELOW THIS HEADER UNLESS YOU KNOW WHAT YOU ARE DOING
#
#==============================================================================

.DEFAULT_GOAL := help
SHELL := /bin/sh
DEBUG ?= 0

.PHONY: help
help:
	@echo ''
	@echo "$(BOLD)$(BLUE)----------------------------------------------------------$(RESET)"
	@echo "  $(BOLD) DOTMODULES make interface $(RESET)"
	@echo "$(BOLD)$(BLUE)----------------------------------------------------------$(RESET)"
	@echo ''
	@echo "   $(BOLD)$(BLUE)help$(RESET)              Prints out this help message."
	@echo "   $(BOLD)$(GREEN)dm$(RESET)                Open up the DotModules tool."
	@echo ''

.PHONY: dm
dm:
	@cd $(RELATIVE_DOTMODULES_REPO_ROOT_PATH); $(PYTHON_INTERPRETER) dm.py \
		--debug '$(DEBUG)' \
		--relative-modules-path '$(RELATIVE_MODULES_PATH)' \
		--config-file-name '$(CONFIG_FILE_NAME)' \
		--text-wrap-limit '$(CLI__TEXT_WRAP_LIMIT)' \
		--indent '$(CLI__INDENT)' \
		--column-padding '$(CLI__COLUMN_PADDING)' \
		--prompt-template '$(CLI__PROMPT_TEMPLATE)' \
		--hotkey-exit '$(CLI__HOTKEYS__EXIT)' \
		--hotkey-help '$(CLI__HOTKEYS__HELP)' \
		--hotkey-hooks '$(CLI__HOTKEYS__HOOKS)' \
		--hotkey-modules '$(CLI__HOTKEYS__MODULES)' \
		--hotkey-variables '$(CLI__HOTKEYS__VARIABLES)' \
		--warning-wrapped-docs '$(WARNING__WRAPPED_DOCS)'
