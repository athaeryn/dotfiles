function linkup () {
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
cp ssh/config ~/.ssh/example-config
echo "Remember to set up ~/.ssh if you haven't."

# tmux
linkup tmux/tmux.conf ~/.tmux.conf

# vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
linkup vim/vimrc ~/.vimrc
linkup vim/after ~/.vim/
linkup vim/bundles.vim ~/.vim/
echo "If you haven't installed NeoBundle:"
echo "  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
echo "  vim +NeoBundleInstall +q"

# zsh
mkdir -p ~/.zsh
linkup zsh/zshrc ~/.zshrc
linkup zsh/zshenv ~/.zshenv
linkup zsh/func ~/.zsh
linkup zsh/modules ~/.zsh
linkup zsh/spectrum.zsh ~/.zsh
