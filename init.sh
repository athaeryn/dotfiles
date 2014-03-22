function linkup () {
  echo "ln -Ffs $(pwd)/$1 $2"
  ln -Ffs "$(pwd)/$1" "$2"
}

# git
linkup git/gitconfig ~/.gitconfig
linkup git/gitignore_global ~/.gitignore_global

# irb
linkup irb/irbrc ~/.irbrc

# pow
linkup pow/powconfig ~/.powconfig

# ssh
mkdir -p ~/.ssh
if [ -f ~/Dropbox/ssh/config ]; then
  ln -Ffs ~/Dropbox/ssh/config ~/.ssh
else
  echo "\n>> You should set up ssh config with Dropbox.\n"
fi
cp ssh/config ~/.ssh/example-config
echo "\n>> Remember to set up ~/.ssh if you haven't.\n"


# tmux
linkup tmux/tmux.conf ~/.tmux.conf

# vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
linkup vim/vimrc ~/.vimrc
linkup vim/after ~/.vim/
linkup vim/bundles.vim ~/.vim/
echo "\nIf you haven't installed NeoBundle:"
echo "  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
echo "  vim +NeoBundleInstall +q\n"


# zsh
mkdir -p ~/.zsh
linkup zsh/zshrc ~/.zshrc
linkup zsh/zshenv ~/.zshenv
linkup zsh/func ~/.zsh
linkup zsh/modules ~/.zsh
linkup zsh/spectrum.zsh ~/.zsh
