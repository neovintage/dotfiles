PATH=$HOME:/opt/homebrew/bin:/usr/local/bin:$PATH

## Terminal Prompt duh
##
PS1="\n\[\e[1;31m\]>\[\e[0m\] "

## Dotfile tracking
##
alias cfg='/usr/bin/git --git-dir=/Users/neovintage/.cfg/ --work-tree=/Users/neovintage'

## asdf version manager
##
. $HOME/.asdf/asdf.sh

## General Platform stuff
##
## export ARCHFLAGS="-arch x86_64"
export EDITOR='vim'
export CLICOLOR=1

## My commands
##
alias ls="ls -GF"
alias ll="ls -alGF"
alias gs='git status -sb'
alias gc='git commit'
alias gd='git diff'
alias ga='git add'
alias pg_start='postgres -D /usr/local/var/postgres'
