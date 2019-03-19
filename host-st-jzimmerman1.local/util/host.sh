#
# host.sh - Host-dependent configurations for "st-jzimmerman1.local":
#           Stripe-specific config
#
# Author
#   Jake Zimmerman <jake@zimmerman.io>
#
# Usage
#   Source this file.
#
# Notes
#   Defines `update-host` which is called by auto-update.sh's `update`
#   function. Make sure to source this file before it.
#
# TODOs
#   - This file isn't as modular as it could be.

# ----- PATH and MANPATH ------------------------------------------------------

# Use GNU coreutils with their actual names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Add diff-highlight from Git contrib
export PATH="$PATH:/usr/local/opt/git/share/git-core/contrib/diff-highlight"

export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/sbin"

export PATH="$PATH:$HOME/.local/bin"

# ----- From Stripe IT department ---------------------------------------------

export PATH="/Users/jzimmerman/stripe/henson/bin:$PATH"
source /Users/jzimmerman/.rbenvrc
rbenv rehash
source ~/.stripe-repos.sh

# ----- aliases ---------------------------------------------------------------

# Double double letters are hard
which coffee &> /dev/null && alias coffe="coffee"

# Use neovim for the lulz
alias vim="nvim -p"
alias vimdiff="nvim -d"

# Override BSD grep with GNU equivalent
which ggrep &> /dev/null && alias grep="ggrep --color=auto";

alias cdsc="cd ~/stripe/checkout-js"
alias cds="cd ~/stripe"

# ----- Haskell ---------------------------------------------------------------

# Have Haskell Stack use XDG Base Directory spec
export STACK_ROOT="$XDG_DATA_HOME/stack"

# ----- Prompt  ---------------------------------------------------------------

export PROMPT_PURE_DIR_COLOR="%{$ccyan%}"
export PROMPT_PURE_SUCCESS_COLOR="%{$cmagentab%}"

# ----- Miscellaneous ---------------------------------------------------------

# update-host
# Usage:
#     update-host
#
# You should never have to call this. It's called when you call `update`
update-host () {
  echo "$cblueb==>$cwhiteb Updating Homebrew...$cnone"
  brew update

  echo "$cblueb==>$cwhiteb Checking Homebrew...$cnone"
  brew doctor

  echo "$cblueb==>$cwhiteb Checking for outdated brew packages...$cnone"
  brew outdated --verbose

}
