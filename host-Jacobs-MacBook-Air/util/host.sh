#
# host.sh - Host-dependent configurations for "Jacobs-MacBook-Air"
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

# Use up-to-date sqlite3
export PATH="/usr/local/opt/sqlite3/bin:$PATH"

# Use executables installed to a project by npm
export PATH="$PATH:node_modules/.bin"

# Add diff-highlight from Git contrib
export PATH="$PATH:/usr/local/opt/git/share/git-core/contrib/diff-highlight"

# Android and Processing...
export ANDROID_HOME="/Users/jake/Library/Android/sdk"
export PATH="$PATH:/Users/jake/Library/Android/sdk/platform-tools:/Users/jake/Library/Android/sdk/tools"

export PATH="$PATH:$HOME/.local/bin"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# cc0 is installed to home bin folder
export PATH="$PATH:$HOME/bin/cc0.d/bin"



# Disable Homebrew analytics until Homebrew/brew#145 is addressed
export HOMEBREW_NO_ANALYTICS=1

# ----- aliases ---------------------------------------------------------------

# OS X has an annoying tendency of trying to change your hostname.
# Run this to get it back.
alias resethostname='sudo scutil --set HostName Jacobs-MacBook-Air'

alias kinitandrew="kinit jezimmer@ANDREW.CMU.EDU"
alias ka="kinitandrew"

alias sml="rlwrap sml"

# Double double letters are hard
which coffee &> /dev/null && alias coffe="coffee"

# Use neovim for the lulz
alias vim="nvim -p"
alias vimdiff="nvim -d"

# Override BSD grep with GNU equivalent
which ggrep &> /dev/null && alias grep="ggrep --color=auto"

# ignore jrnl entries (abuse histignorespace)
alias jrnl=" jrnl"

# ----- Specific programs -----------------------------------------------------

# ruby...
# To use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT="/usr/local/var/rbenv"
export PATH="/usr/local/var/rbenv/shims:$PATH"
# We want to set our PATH manually, so skip this line in the init code
eval "$(rbenv init - | tail -n +2)"

# Settings for virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh 2> /dev/null

# Have Haskell Stack use XDG Base Directory spec
export STACK_ROOT="$XDG_DATA_HOME/stack"

# Have Smackage use XDG Base Directory spec
export SMACKAGE_HOME="$XDG_DATA_HOME/smackage"

# GNUPG-specific settings
source ~/.util/gnupg.sh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Change my iTerm2 profile based on SOLARIZED variable
# See also: ~/.util/functions/itpt.sh
if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
  echo -e "\033]50;SetProfile=solarized-$SOLARIZED\a"
fi

# ----- Prompt  ---------------------------------------------------------------

export PROMPT_PURE_DIR_COLOR="%{$cmagentab%}"

# ----- Miscellaneous ---------------------------------------------------------

# update-host
# Usage:
#     update-host
#
# You should never have to call this. It's called when you call `update`
update-host () {
  echo "$cblueb==>$cwhiteb Renewing Kerberos ticket...$cnone"
  kinitandrew

  echo "$cblueb==>$cwhiteb Updating Homebrew...$cnone"
  brew update

  echo "$cblueb==>$cwhiteb Checking Homebrew...$cnone"
  brew doctor

  echo "$cblueb==>$cwhiteb Checking for outdated brew packages...$cnone"
  brew outdated --verbose

  echo "$cblueb==>$cwhiteb Checking for outdated npm packages...$cnone"
  npm -g outdated

  echo "$cblueb==>$cwhiteb Checking for outdated pip packages...$cnone"
  pip2 list --outdated

  echo "$cblueb==>$cwhiteb Checking for outdated pip3 packages...$cnone"
  pip3 list --outdated

}
