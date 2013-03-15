#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim
mkdir -p ~/.vim/bundle/bclose/plugin
cp bclose.vim ~/.vim/bundle/bclose/plugin/bclose.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/hallison/vim-markdown.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/tpope/vim-repeat.git 
git clone https://github.com/tpope/vim-surround.git
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup

