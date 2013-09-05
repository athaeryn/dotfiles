# Starting Over
### A not Exactly Definitive but Still (Hopefully) Helpful Guide to Beginning Again

----

These are the steps that I take when starting fresh on a new system, and are
here as a reference in case something blows up (or I just get a new system) and
I have to start from scratch.

## 1. Install Xcode from the App Store

While waiting (forever), see Appendix A.

When finished, start installing other things from App Store:

- GeekTool
- LiveReload
- Marked
- Pocket
- Silkscreen
- Tweetbot

## 2. Install Command Line Tools

Xcode > Preferences > Downloads, Command Line Tools

## 3. Install Homebrew

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

## 4. Install rbenv

    brew install rbenv && brew install ruby-build

## 5. Install ZSH

    brew install zsh
    chsh -s /bin/zsh

## 6. Install oh-my-zsh

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

## 7. Release the dotfiles!

    mkdir ~/git
    git clone git://github.com/athaeryn/dotfiles

Link everything up.

## 8. Install NeoBundle

    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## 9. Install bundles

    vim +NeoBundleInstall

## 10. Install other Homebrew packages:

    brew tap phinze/cask
    brew install brew-cask git reattach-to-user-namespace tmux tree vim

## 11. Install apps with brew-cask

    brew cask install alfred app-zapper arduino blender caffeine cfxr daisy-disk dropbox eclipse firefox google-chrome google-chrome-canary growlnotify iterm2 jumpcut lime-chat moom name-changer one-password spotify steam totalspaces transmit u-torrent you-need-a-budget

## 12. Link Alfred with cask

    brew cask alfred link

## 13. Set up SSH

Use ~/.ssh/config as a guide.

## 14. Install MySQL, PHP, and Nginx...

...with this [helpful guide](http://xig.me/osx-php-mysql-nginx.html)!

----

# Appendix A

While waiting for Xcode, set Preferences:

- General
    - Highlight color: purple
    - Sidebar icon size: Small
- Dock
    - Remove things
    - Size: make smaller
    - `[x]` Automatically hide and show the Dock
- Keyboard:
    - Key Repeat: second to right
    - Delay Until Repeat: third
    - `[x]` Use all F1, F2, etc. keys as standard function keys
    - `[ ]` Adjust keyboard brightness in low light
    - Modifier Keys...
        - Caps Lock: Control
- Keyboard Shortcuts:
    - Mission Control
        - `[ ]` Show Desktop (F11)
        - `[ ]` Show Dashboard (F11)
- Sound
    - `[ ]` Play feedback when volume is changed
- Mail, Contacts & Calendars
    - Set up accounts
