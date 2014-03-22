function linkup () {
  echo "ln -Ffs $(pwd)/$1 $2"
  ln -Ffs "$(pwd)/$1" "$2"
}


#        _ _
#   __ _(_) |_
#  / _` | | __|
# | (_| | | |_
#  \__, |_|\__|
#  |___/
#
linkup git/gitconfig ~/.gitconfig
linkup git/gitignore_global ~/.gitignore_global


#  _      _
# (_)_ __| |__
# | | '__| '_ \
# | | |  | |_) |
# |_|_|  |_.__/
#
linkup irb/irbrc ~/.irbrc

#  _ __   _____      __
# | '_ \ / _ \ \ /\ / /
# | |_) | (_) \ V  V /
# | .__/ \___/ \_/\_/
# |_|
#
linkup pow/powconfig ~/.powconfig

#          _
#  ___ ___| |__
# / __/ __| '_ \
# \__ \__ \ | | |
# |___/___/_| |_|
#
mkdir -p ~/.ssh
if [ -f ~/Dropbox/ssh/config ]; then
  ln -Ffs ~/Dropbox/ssh/config ~/.ssh
else
  echo "\n>> You should set up ssh config with Dropbox.\n"
fi
cp ssh/config ~/.ssh/example-config
echo "\n>> Remember to set up ~/.ssh if you haven't.\n"


#  _
# | |_ _ __ ___  _   ___  __
# | __| '_ ` _ \| | | \ \/ /
# | |_| | | | | | |_| |>  <
#  \__|_| |_| |_|\__,_/_/\_\
#
linkup tmux/tmux.conf ~/.tmux.conf


#        _
# __   _(_)_ __ ___
# \ \ / / | '_ ` _ \
#  \ V /| | | | | | |
#   \_/ |_|_| |_| |_|
#
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
linkup vim/vimrc ~/.vimrc
linkup vim/after ~/.vim/
linkup vim/bundles.vim ~/.vim/
echo "\nIf you haven't installed NeoBundle:"
echo "  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
echo "  vim +NeoBundleInstall +q\n"


#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|
#
mkdir -p ~/.zsh
linkup zsh/zshrc ~/.zshrc
linkup zsh/zshenv ~/.zshenv
linkup zsh/func ~/.zsh
linkup zsh/modules ~/.zsh
linkup zsh/spectrum.zsh ~/.zsh
