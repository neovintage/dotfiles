alias cfg='/usr/bin/git --git-dir=/Users/rsilkaitis/.myconfig/ --work-tree=/Users/rsilkaitis'
PS1="\n\[\e[1;31m\]>\[\e[0m\] "

PATH=$HOME/.anyenv/bin:/usr/local/bin:/usr/local/heroku/bin:$PATH

## This is for python
##
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export WORKON_HOME="$HOME/.virtualenvs"

## General Platform stuff
##
export ARCHFLAGS="-arch x86_64"
export EDITOR='vim'
export CLICOLOR=1
export PG_CONFIG=/Applications/Postgres93.app/Contents/MacOS/bin

## My commands
##
alias ls="ls -GF"
alias ll="ls -alGF"
alias gs='git status -sb'
alias gc='git commit'
alias gd='git diff'
alias ga='git add'
alias pg_start='pg_ctl -D /usr/local/var/postgres start'

## Run Anyenv
##
eval "$(anyenv init -)"
