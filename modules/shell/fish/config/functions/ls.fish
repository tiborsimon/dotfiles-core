function ls
  LC_ALL='C' command ls \
    --human-readable \
    --group-directories-first \
    --literal \
    --color=auto \
    $argv
end
