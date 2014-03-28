#!/bin/sh

mkdir -p ~/.ssh
if [ -f ~/Dropbox/ssh/config ]; then
  ln -Ffs ~/Dropbox/ssh/config ~/.ssh
else
  echo "\n>> You should set up ssh config with Dropbox.\n"
fi
cp ssh/config ~/.ssh/example-config
echo "\n>> Remember to set up ~/.ssh if you haven't.\n"
