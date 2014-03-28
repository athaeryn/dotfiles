#!/bin/zsh

# Bind some keys
bindkey -v # vi mode because fuck it, why not?
bindkey '^a' beginning-of-line
bindkey '^d' delete-char
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# http://dougblack.io/words/zsh-vi-mode.html
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
