# Source things only if they exist
function try_source () {
  if [ -f "$@" ]; then
    source "$@"
  fi
}


autoload -U colors zsh-mime-setup select-word-style
colors                  # colors
zsh-mime-setup          # run everything as if it's an executable
select-word-style bash  # ctrl+w on words


try_source ~/.zsh/spectrum.zsh
# try_source ~/.git-completion.sh


# MODULES
try_source ~/.zsh/modules/keybindings.zsh
try_source ~/.zsh/modules/aliases.zsh
try_source ~/.zsh/modules/gource.zsh
try_source ~/.zsh/modules/android.zsh


# COMPLETION
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case


# zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
# fpath=(~/.zsh/funcs $fpath)
zstyle :omz:plugins:ssh-agent agent-forwarding on


# FUNCTIONS
function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function git_branch_prompt () {
  git branch | grep \* | awk '{printf "|%s| $", $2}'
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && git_branch_prompt && return
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
function mam () {
  vim -c 'source $VIMRUNTIME/ftplugin/man.vim' -c ":Man $@" -c 'only'
}

NOTESPATH=~/notes
  function notes () {
  DAYFILE="$(date +%d-%m-%y.txt)"
  <"$NOTESPATH/$DAYFILE"
}

function notef () {
  ag "$*" "$NOTESPATH"
}

# For using the Google
function google () {
  query="$(ruby -r cgi -e 'puts CGI.escape(ARGV[0])' "$*")"
  open http://google.com/#q="$query"
}

function serv () {
  PORT=${1:-3000}
  ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => ARGV[0], :DocumentRoot => Dir.pwd).start' $PORT
}

function light () {
  echo -e "\033]50;SetProfile=manderson-light\x7"
}
function dark () {
  echo -e "\033]50;SetProfile=manderson-dark\x7"
}



setopt PROMPT_SUBST
PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg[blue]%}$(collapse_pwd)
%{$reset_color%}$(prompt_char) '


export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin:/usr/local/opt/node:/usr/local/share/npm/bin
export VISUAL=vim
export EDITOR=vim
export LSCOLORS=exfxcxdxbxegedabagacad
export NODE_PATH=/usr/local/lib/node
export HOSTSPATH=~/git/buildhosts


export COWPATH=/usr/local/Cellar/cowsay/3.03/share/cows


export TERM=xterm-256color


# rbenv needs this
eval "$(rbenv init -)"

try_source ~/.fzf.zsh
