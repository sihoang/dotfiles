#!/bin/sh
# This script checks if the local configs are in-sync with dotfiles repo
# Perform diff localversion gitversion
# Usage: ./sync.sh


# Declare items (files and/or directories) to be tracked
# Array of tuples: local,git
# NO SPACES IN BETWEEN
declare -a TRACKED_ITEMS=(
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

total_items=${#TRACKED_ITEMS[@]};
current_items=1;
for pair in "${TRACKED_ITEMS[@]}"; do
  IFS=",";
  set $pair;

  echo "*********************************************************************
    Checking item $current_items of $total_items
  ";

  diff_content=$(diff -ruN --unidirectional-new-file $1 $2 | colordiff);

  if [ "$diff_content" == "" ]; then
    echo "Up to date $1 $2";
  else
    # clear;
    echo $diff_content;
    echo "
      What do you want to do with this item?

      0) Do nothing. (Default)

      1) Take the local's version.
          cp $1 $2

      2) Take the git's version and keep a local backup.
          mv $1 $1.backup
          cp $2 $1

    ";

    read -p " Select an action (0, 1 or 2): " action;
    case $action in
      1)
        echo "cp $1 $2";
        cp $1 $2;
        ;;
      2)
        echo "cp $2 $1";
        mv $1 $1.backup;
        cp $2 $1;
        ;;
    esac
  fi

  echo ;
  current_items=$((current_items + 1))
  unset IFS;
done
