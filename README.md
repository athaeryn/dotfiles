# My dotfiles

This isn't even their final form!

# Setup

This should live at `~/dotfiles` unless you know what you're doing. Things are
installed using GNU stow.

## 1. Install Command Line Tools

Google it, son.

## 2. Install Homebrew

```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```


## 3. Install You Some Homebrew Packages:

```sh
$ brew install stow git reattach-to-user-namespace tmux vim rbenv ruby-build

# zsh
$ brew install --disable-etcdir zsh
$ chsh -s $(which zsh)
```
I'm going to do this with a `Brewfile` eventually, I think.

## 4. Stow those packages

```sh
$ cd ~/dotfiles
$ stow vim
$ stow zsh
$ stow git
$ stow pow
$ stow irb
$ stow tmux
```

