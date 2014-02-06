#!/bin/zsh
alias zshconfig="vim ~/.zshrc ; source ~/.zshrc"
alias lgrep="l | grep"
alias pshop="open -a /Applications/Adobe\ Photoshop\ CC/Adobe\ Photoshop\ CC.app"

alias rhash="rbenv rehash"
alias todos="ag TODO\:"

# Spelling helpers
alias gerp="grep"

# Get my IP
alias myip="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"

# Use macvim
alias vim="mvim -v"

# Remove .DS_Store
alias nods="rm -f .DS_Store"

# Always use LSCOLORS
alias ls="ls -G"

# ls -la with trailing / for directories
alias lsa="ls -lahp"
