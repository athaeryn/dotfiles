# Starting Over

----

## 1. Install Command Line Tools

Xcode > Preferences > Downloads, Command Line Tools

## 2. Install things

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew install rbenv ruby-build
    brew install --disable-etcdir zsh
    chsh -s $(which zsh)


## 2. Run init.sh

From the dotfiles directory:

    sh init.sh

## 3. Install NeoBundle

    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## 4. Install bundles

    vim +NeoBundleInstall

## 5. Install other Homebrew packages:

    brew install git reattach-to-user-namespace tmux tree vim

## 6. Set up SSH

Use ~/.ssh/config as a guide.

## 7. Install MySQL, PHP, and Nginx...

...with this [helpful guide](http://xig.me/osx-php-mysql-nginx.html)!

