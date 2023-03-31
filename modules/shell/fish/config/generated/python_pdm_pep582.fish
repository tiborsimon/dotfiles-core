if test -n "$PYTHONPATH"
    set -x PYTHONPATH '/opt/homebrew/Cellar/pdm/2.4.6/libexec/lib/python3.11/site-packages/pdm/pep582' $PYTHONPATH
else
    set -x PYTHONPATH '/opt/homebrew/Cellar/pdm/2.4.6/libexec/lib/python3.11/site-packages/pdm/pep582'
end
