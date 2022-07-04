if status is-interactive
  # Making sure that the default XDG directories are present before we load the
  # compiled environment file.
  set --global --export 'XDG_CACHE_HOME' '/home/tibor/.cache'
  set --global --export 'XDG_CONFIG_HOME' '/home/tibor/.config'
  set --global --export 'XDG_DATA_HOME' '/home/tibor/.local/share'

  # Setting up the environment variables..
  source $HOME/.config/fish/generated/env_script.fish

  # Setting up the local PATH variable..
  source $HOME/.config/fish/generated/path_script.fish

  # Loading the collected abbreviations..
  source $HOME/.config/fish/generated/abbreviation_script.fish


  # Loading the collected post config commands..
  source $HOME/.config/fish/generated/post_config_script.fish
end
