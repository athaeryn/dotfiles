# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ALIASES {{
    alias zshconfig="vim ~/.zshrc ; source ~/.zshrc"
    alias lgrep="l | grep"
    alias pshop="open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app"

    alias rhash="rbenv rehash"

    # Spelling helpers
    alias gerp="grep"
    alias git="~/bin/leaf-collector"
#}}

# Red dots displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Plugins can be found in ~/.oh-my-zsh/plugins
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh


# FUNCTIONS {{
    function collapse_pwd {
        echo $(pwd | sed -e "s,^$HOME,~,")
    }

    function prompt_char {
        git branch >/dev/null 2>/dev/null && echo '±' && return
        svn branch >/dev/null 2>/dev/null && echo '' && return
        echo '$'
    }

    function virtualenv_info {
        [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
    }

    # View diffs in view
    function vd {
        git diff $@ | view -
    }

    # Notify me after a long running command
    function prowl {
        $@
        /usr/local/bin/growlnotify -p Emergency "Task" -m "Done"
    }

    # Read man pages in Vim
    function man () {
        vim -c 'source $VIMRUNTIME/ftplugin/man.vim' -c ":Man $@" -c 'only'
    }
#}}



export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin:/usr/local/opt/node:/usr/local/share/npm/bin

PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg[blue]%}$(collapse_pwd)
%{$reset_color%}$(git_prompt_info)$(virtualenv_info) $(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# rbenv needs this
eval "$(rbenv init -)"

export VISUAL=vim
export EDITOR=vim
export HOSTSPATH=~/git/buildhosts
export LSCOLORS=gxfxcxdxbxegedabagacad
export NODE_PATH=/usr/local/lib/node

# Gource {{
    #function dimensions_for_gource {
        #ruby -e 'puts `system_profiler SPDisplaysDataType | grep Resolution`.lines[0][22..-1].tr(" ", "")'
    #}
    ## always load gource config ~/.gource
    #alias gource="gource --load-config ~/.gourcerc"
    #_D=$(dimensions_for_gource)
    #alias gourcefull="gource --load-config ~/.gourcerc -f -$_D"
#}}

# COMPLETION {{
    # for custom autocompletions
    fpath=(~/.zsh/completions $fpath)

    # compsys init
    autoload -U compinit
    compinit

    # Show completion menu when there is more that one option
    zstyle ':completion:*' menu select=2
#}}

zstyle :omz:plugins:ssh-agent agent-forwarding on

# Android {{{

export PATH=$PATH:~/android/android-sdk-macosx/tools
export PATH=$PATH:~/android/android-sdk-macosx/platform-tools
export ANDROID_HOME=~/android/android-sdk-macosx

# }}}

# Cowsay {{{

export COWPATH=/usr/local/Cellar/cowsay/3.03/share/cows

# }}}

