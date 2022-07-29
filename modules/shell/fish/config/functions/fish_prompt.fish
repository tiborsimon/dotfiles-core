function fish_prompt --description 'Write out the prompt'
    set --local last_status $status
    echo

    set_color 666666
    echo -n '╭─ '
    set_color normal

    if test $last_status -ne 0
      set_color --bold red
      echo -n "[$last_status] "
      set_color normal
    end

    if jobs --query
      # Some old BSD implementation of wc pads the output with spaces, hence
      # the additional xargs call..
      set --local background_job_count (jobs --pid | wc -l | xargs)
      set_color --bold yellow
      echo -n "[$background_job_count] "
      set_color normal
    end

    # Python virtual env display with virtualfish.
    if set -q VIRTUAL_ENV
      set_color --bold --background 306998 white
      echo -n '['
      echo -n (basename "$VIRTUAL_ENV")
      echo -n ']' 
      set_color normal
      echo -n ' '
    end

    # PWD
    set_color --bold 039CE1
    echo -n (prompt_pwd --dir-length=0)
    set_color normal

    # Options
    set --global __fish_git_prompt_show_informative_status 1
    set --global __fish_git_prompt_showupstream informative
    set --global __fish_git_prompt_showcolorhints 1
    set --global __fish_git_prompt_use_informative_chars 0
    set --global __fish_git_prompt_showuntrackedfiles 1
    set --global __fish_git_prompt_showdirtystate 1
    set --global __fish_git_prompt_showstashstate 1
    set --global __fish_git_prompt_describe_style branch
    
    set --global __fish_git_prompt_color_branch 5FD700
    
    # Icons based on https://medium.com/@joshuacrass/git-fish-prompt-faa389fff07c
    set --global __fish_git_prompt_char_cleanstate ' 👍'
    set --global __fish_git_prompt_char_conflictedstate ' ⚠️'
    set --global __fish_git_prompt_char_dirtystate ' 💩'
    set --global __fish_git_prompt_char_invalidstate ' 🤮'
    set --global __fish_git_prompt_char_stagedstate ' 🚥'
    set --global __fish_git_prompt_char_stashstate ' 📦'
    set --global __fish_git_prompt_char_stateseparator ''
    set --global __fish_git_prompt_char_untrackedfiles ' 🔍'
    set --global __fish_git_prompt_char_upstream_ahead ' ☝️'
    set --global __fish_git_prompt_char_upstream_behind ' 👇'
    set --global __fish_git_prompt_char_upstream_diverged ' 🚧'
    set --global __fish_git_prompt_char_upstream_equal ' 💯'

    if git is-repo
      echo -n ' on'
      fish_git_prompt
    end

    echo
    set_color normal

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    set_color 666
    echo -n '╰─ '

    if test $last_status -eq 0
      set_color --bold green
      echo -n '$ '
    else
      set_color --bold red
      echo -n '$ '
    end

    set_color normal
end
