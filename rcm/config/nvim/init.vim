" This is just a shim that allows me to keep my config in ~/.vim and share it.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
