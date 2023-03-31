if status is-interactive
  # Making sure that the default XDG directories are present before we load the
  # compiled environment file.
  set --global --export 'XDG_CACHE_HOME' "$HOME/.cache"
  set --global --export 'XDG_CONFIG_HOME' "$HOME/.config"
  set --global --export 'XDG_DATA_HOME' "$HOME/.local/share"

  bind \ck 'up-or-search'
  bind \cj 'down-or-search'
  bind \cl 'accept-autosuggestion'

  # Setting up the environment variables..
  source $HOME/.config/fish/generated/env_script.fish

  # Setting up the local PATH variable..
  source $HOME/.config/fish/generated/path_script.fish

  # Loading the collected abbreviations..
  source $HOME/.config/fish/generated/abbreviation_script.fish

  # Loading the collected post config commands..
  source $HOME/.config/fish/generated/post_config_script.fish

  # Loading the generated python PDM PEP582 integration..
  source $HOME/.config/fish/generated/python_pdm_pep582.fish
end
