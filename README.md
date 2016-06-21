# My dotfiles




This is meant to sit on top of the [space150
dotfiles](https://github.com/space150/dotfiles) and be managed with
[rcm](https://github.com/thoughtbot/rcm).


## 1. Install Command Line Tools

Install Xcode, then `xcode-select --install`.


## 2. Install Homebrew

```sh
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```


## 3. Install You Some Homebrew Packages For Great Good


## 4. RCM

(Assuming this repo is at `~/code/athaeryn/dotfiles`)

```sh
$ cd ~/code/athaeryn/dotfiles
$ ln -s rcm ~/dotfiles/local
$ cd && rcup -v
```


# Appendix: Homebrew packages you should probably install

```
install git
install vim
install stow
install tmux
install reattach-to-user-namespace
install rbenv
install ruby-build

install ccrypt
install ctags
install direnv
install fzf
install macvim
install markdown
install mysql
install pow
install the_silver_searcher
install tree
```

