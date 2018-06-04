#!/bin/sh
# This script checks if the local configs are in-sync with dotfiles repo
# Usage: ./sync.sh
# Flags:
#   -g git to local i.e. git takes precedence CAUTION! BACK UP YOUR LOCAL FILES!!!
#   -l local to git i.e. local takes precedence

gflag="";
lflag="";

check_already_specified() {
  if [ ! -z $2 ]; then
    echo ERROR: $1 already specified. Choose either -g or -l.;
    exit 1;
  fi
}

# Parse flags
while getopts "gl" flag; do
  case "$flag" in
    g)
      check_already_specified "-l" $lflag;
      gflag="true";
      ;;
    l)
      check_already_specified "-g" $gflag;
      lflag="true";
      ;;
    *)
      exit 1;
      ;;
  esac
done

# Declare files to be tracked
# Array of tuples: local,git
# NO SPACES IN BETWEEN
declare -a TRACKED_FILES=(
 "$HOME/.config/nvim/init.vim","init.vim"
 "$HOME/.tmux.conf",".tmux.conf"
 "$HOME/.zshrc",".zshrc"
 "$HOME/.zprofile",".zprofile"
 "$HOME/.profile",".profile"
 "$HOME/.bash_profile",".bash_profile"
 "$HOME/.bashrc",".bashrc"
)

# Better check if there're unstaged files
# TODO sync with remote git
# git pull

for pair in "${TRACKED_FILES[@]}"; do
  IFS=",";
  set $pair;
  diff -ruN --unidirectional-new-file $1 $2 | colordiff;

  # TODO: Consolidate based on gflag/lflag

  unset IFS;
done
