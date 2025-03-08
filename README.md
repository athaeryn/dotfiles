# My dotfiles

## 1. Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Install RCM

```sh
brew install rcm
```

## 3. RCM

```sh
$ cd
$ git clone git@github.com:athaeryn/dotfiles.git .dotfiles
$ ln -s .dotfiles/rcrc .rcrc
$ rcup -v
```

# Install packages with Homebrew

```
zsh
neovim
tmux
reattach-to-user-namespace

git
ccrypt
ctags
direnv
fzf
the_silver_searcher
tree
python3
```

# Set up Python support for Neovim

```
$ cd
$ python3 -m venv .venv
$ source .venv/bin/activate
$ pip3 install --upgrade pynvim
```

# ZSH

After installing `zsh` with Homebrew, add `/opt/homebrew/bin/zsh` to `/etc/shells`, then:

```sh
chsh -s /opt/homebrew/bin/zsh
```

After opening a new terminal:

```sh
compaudit | xargs chmod g-w
```
