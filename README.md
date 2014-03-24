# My dotfiles

This isn't even their final form!

# Setup

`init.sh` does a lot for you.

## 1. Install Command Line Tools

Google it, son.

## 2. Install Other Things

```sh
# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# rbenv
brew install rbenv ruby-build
# zsh
brew install --disable-etcdir zsh
chsh -s $(which zsh)
```


## 3. Run init.sh

From the dotfiles directory:

```sh
sh init.sh
```

## 4. Install You Some Homebrew Packages:

```sh
brew install git reattach-to-user-namespace tmux tree vim
```
    
I'm going to do this with a `Brewfile` eventually, I think.
