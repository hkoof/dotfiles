#!/bin/bash

SRCS="
  .config
  .gitignore
  .tmux.conf
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
source /etc/bash_completion.d/git-prompt
export PS1='\u@\h:\W$(__git_ps1 "[%s]")\$ '
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUPSTREAM="git"
EOF
fi

# neovim
#
nvim_dir=$HOME/nvim-linux-x86_64
if ! [[ -d $nvim_dir ]] ; then
    cd /tmp
    rm nvim-linux-x86_64.tar.gz
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar xzCf $HOME /tmp/nvim-linux-x86_64.tar.gz
fi

echo 'alias nvim=${nvim_dir}/bin/nvim' >> ~/.bash_aliases

if ! [[ -d .config/nvim ]] ; then
    cd
    mkdir -p .config
    cd .config
    git clone https://github.com/hkoof/nvim.hko.git nvim
fi
