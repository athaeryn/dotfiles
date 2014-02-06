#!/bin/zsh

function dimensions_for_gource {
    ruby -e 'puts `system_profiler SPDisplaysDataType | grep Resolution`.lines[0][22..-1].tr(" ", "")'
}
# always load gource config ~/.gource
alias gource="gource --load-config ~/.gourcerc"
_D=$(dimensions_for_gource)
alias gourcefull="gource --load-config ~/.gourcerc -f -$_D"
