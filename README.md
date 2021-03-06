# My dotfiles

## 1. Install Homebrew

```sh
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## 2. Install RCM

```sh
brew tap thoughtbot/formulae
brew install rcm
```

## 3. RCM

(Assuming this repo is at `~/code/athaeryn/dotfiles`)

```sh
$ cd
$ ln -s code/athaeryn/dotfiles/rcrc .rcrc
$ rcup -v
```


# Also install these with Homebrew

```
bash
git
vim
neovim

tmux
reattach-to-user-namespace

rbenv
ruby-build

ccrypt
direnv
the_silver_searcher
tree
```

# ZSH

After installing `zsh` with Homebrew, add `/usr/local/bin/zsh` to `/etc/shells`, then:

```sh
chsh -s /usr/local/bin/zsh
```

After opening a new terminal:

```sh
compaudit | xargs chmod g-w
```

