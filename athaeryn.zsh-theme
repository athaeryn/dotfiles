PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg[blue]%}$(collapse_pwd)
%{$reset_color%}$(git_prompt_info)$(virtualenv_info) $(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

