# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc ; source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#-----------------------\
#-- ALIASES --			|

alias svnaddall="svn st | awk '/\?/ {print $2}' | xargs svn add"
#alias killem='svn st | awk '"'"'/\!/ {print $2}'"'"' | xargs svn rm --force'

alias svnci="ruby ~/bin/svnci.rb"
alias svncilog="cat ~/bin/svnci.log"
alias svnlc="svn log -rHEAD"
alias svnun="svn st | awk '/\?/ {print $2}'" 

alias consolelogs="grep -rc console * | grep -v ":0" | grep -v .svn"

alias getcomposer="curl -s https://getcomposer.org/installer | php ; php composer.phar install"

alias datsass="sass --watch main.scss:main.css"
alias lgrep="l | grep"
alias tsk="ruby ~/bin/tsk.rb"

alias pshop="open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app"

# Spelling helpers
alias gerp="grep"
#				|
#-----------------------/

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:~/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin

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
