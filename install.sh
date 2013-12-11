#!/bin/sh

SRCS="
  .Xresources
  .screenrc
  .config
  .emacs
  .vimrc
  .vimbackup
  .vim
  bin
"

cp -rv $SRCS ~/

# git-config  special treatment: preserve user info
mv ~/.gitconfig ~/.gitconfig.bak 2>/dev/null && sed '/^\[user\]/,/^\[/!d' ~/.gitconfig.bak | sed '$d' >~/.gitconfig
cat .gitconfig >>~/.gitconfig

