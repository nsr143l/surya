#
# host.sh - Host-dependent configurations for "latedays.andrew.cmu.edu"
#
# Description of file.
#
# Author
#   Jake Zimmerman <jake@zimmerman.io>
#
# Usage
#
# Notes
#
# TODOs

# ----- PATH, MANPATH, and LD_LIBRARY_PATH ------------------------------------

# Computer Club contributed software
export PATH="/afs/club/contrib/bin:$PATH";
export MANPATH="$MANPATH:/afs/club.cc.cmu.edu/contrib/man"
export LD_LIBRARY_PATH="/afs/club.cc.cmu.edu/contrib/lib"

export MANPATH="$MANPATH:$HOME/share/man"

# ----- aliases ---------------------------------------------------------------

# Git aliases
alias gl='git log --graph --pretty="%C(bold green)%h%Creset%C(blue)%d%Creset %s"'
alias gla='git log --graph --pretty="%C(bold green)%h%Creset %C(yellow)%an%Creset%C(blue)%d%Creset %s"'

# ----- Prompt  ---------------------------------------------------------------

PROMPT_PURE_DIR_COLOR="%F{green}"

# ----- Miscellaneous ---------------------------------------------------------

# Don't let people write messages to me
mesg n
