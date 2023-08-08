## asdf version manager
##
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export DENO_INSTALL="/Users/neovintage/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$HOME:/opt/homebrew/bin:/usr/local/bin:$PATH

## Terminal Prompt duh
##
export PS1=$'\n'"%F{red}%B➜%b%f "

## Dotfile tracking
##
alias cfg='/usr/bin/git --git-dir=/Users/neovintage/.cfg/ --work-tree=/Users/neovintage'

## General Platform stuff
##
## export ARCHFLAGS="-arch x86_64"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
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

