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

## 3. Install You Some Homebrew Packages

```sh
$ brew bundle

# zsh
$ brew install --disable-etcdir zsh
$ chsh -s $(which zsh)
```

## 4. Stow those packages

Stow was installed for you from the Brewfile. Did you catch that?

```sh
$ cd ~/dotfiles
$ stow dat
```

