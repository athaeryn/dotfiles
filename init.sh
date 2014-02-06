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
cp ssh/config ~/.ssh/git-config
echo "Remember to set up ~/.ssh if you haven't."

# tmux
linkup tmux/tmux.conf ~/.tmux.conf

# vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
linkup vim/vimrc ~/.vimrc
linkup vim/after ~/.vim/.after
linkup vim/bundles.vim ~/.vim


# zsh
mkdir -p ~/.zsh
linkup zsh/zshrc ~/.zshrc
linkup zsh/zshenv ~/.zshenv
linkup zsh/func ~/.zsh
linkup zsh/modules ~/.zsh
linkup zsh/spectrum.zsh ~/.zsh
