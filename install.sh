#!/bin/sh

SRCS="
  .screenrc
  .config
  .gitignore
  .emacs
  .vimrc
  .vimbackup
  .vim
  .profile
  bin
"

cp -rv $SRCS ~/

# git-config  special treatment: preserve user info
mv ~/.gitconfig ~/.gitconfig.bak 2>/dev/null && sed '/^\[user\]/,/^\[/!d' ~/.gitconfig.bak | sed '$d' >~/.gitconfig
cat .gitconfig >>~/.gitconfig

# git-aware bash prompt
if ! grep -q GIT_PS1 ~/.bashrc ; then # crude heuristics for idempotency
    echo >>~/.bashrc
    cat <<\EOF >>~/.bashrc
source ~/bin/git-prompt.sh
export PS1='\u@\h:\W$(__git_ps1 "[%s]")\$ '
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUPSTREAM="git"
EOF
fi

