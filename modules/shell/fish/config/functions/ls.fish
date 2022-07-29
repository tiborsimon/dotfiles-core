function ls
  if test (uname -s) = 'Darwin'
    # On macOS the default 'ls' utility has a very limited options in terms of
    # customization.
    LC_ALL='C' command gls \
      --human-readable \
      --group-directories-first \
      --literal \
      --color=auto \
      $argv
  else
    LC_ALL='C' command ls \
      --human-readable \
      --group-directories-first \
      --literal \
      --color=auto \
      $argv
  end
end
