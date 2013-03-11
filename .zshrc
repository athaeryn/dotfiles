# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

#   ALIASES
# alias svnaddall="svn st | awk '/\?/ {print $2}' | xargs svn add"
# alias svnci="ruby ~/bin/svnci.rb"
# alias svncilog="cat ~/bin/svnci.log"
# alias svnlc="svn log -rHEAD"
# alias svnun="svn st | awk '/\?/ {print $2}'" 
# alias consolelogs="grep -rc console * | grep -v ":0" | grep -v .svn"
# alias getcomposer="curl -s https://getcomposer.org/installer | php ; php composer.phar install"
alias zshconfig="vim ~/.zshrc ; source ~/.zshrc"
alias datsass="sass --watch main.scss:main.css"
alias lgrep="l | grep"
alias tsk="ruby ~/bin/tsk.rb"
alias pshop="open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app"
# Spelling helpers
alias gerp="grep"

# Red dots displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Plugins can be found in ~/.oh-my-zsh/plugins
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    svn branch >/dev/null 2>/dev/null && echo '' && return
    echo '➜ '
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function tsk_status {
    if [ -e ~/bin/tsk/status.txt ];
    then
        cat ~/bin/tsk/status.txt 
    fi
}

function vd {
    git diff $@ | view -
}

function prowl {
    $@
    /usr/local/bin/growlnotify -p Emergency "Task" -m "Done"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM 

export PATH=/usr/local/bin:/usr/local/sbin:~/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin

PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg[blue]%}$(collapse_pwd)
%{$reset_color%}$(git_prompt_info)$(virtualenv_info) $(prompt_char) '

RPROMPT='%{$fg[white]%}$(tsk_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

export VISUAL=vim
export EDITOR=vim
export HOSTSPATH=~/git/buildhosts
export LSCOLORS=gxfxcxdxbxegedabagacad
#export JAVA_HOME=$(/usr/libexec/java_home)
