#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/hallison/vim-markdown.git
git clone https://github.com/kien/ctrlp.vim.git
git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/mileszs/ack.vim.git
# Define :Bclose to close a buffer without closing a window using
# the first script on
# http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window
# and placing it in
# ~/.vim/bundle/bclose/plugin/bclose.vim
git clone https://github.com/tpope/vim-repeat.git 
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/scrooloose/nerdtree.git
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup

