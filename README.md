# My dotfiles

This is meant to sit on top of the [space150
dotfiles](https://github.com/space150/dotfiles) and be managed with
[rcm](https://github.com/thoughtbot/rcm).


## 1. Install Command Line Tools

Install Xcode from the App Store.

```sh
xcode-select
```


## 2. Install Homebrew

```sh
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```


## 3. Install You Some Homebrew Packages For Great Good

```sh
$ brew bundle
```


## 4. RCM

(Assuming this repo is at `~/git/dotfiles`)

```sh
$ cd ~/git/dotfiles
$ ln -s rcm ~/dotfiles/local
$ cd && rcup -v
```
