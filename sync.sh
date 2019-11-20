#!/bin/bash
# This script checks if the local configs are in-sync with dotfiles repo.
# Perform diff localversion gitversion. Require colordiff to be installed.
# It will prompt you before making any changes.
#
#
# Usage: ./sync.sh


# Declare items to be tracked. An item can be a file or a directory (TODO)
# Array of tuples: local,git
# NO SPACES IN BETWEEN
declare -a TRACKED_ITEMS=(
 "$HOME/.config/nvim/init.vim","init.vim"
 "$HOME/.tmux.conf",".tmux.conf"
 "$HOME/.zshrc",".zshrc"
 "$HOME/.zprofile",".zprofile"
 "$HOME/.profile",".profile"
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

  diff_content=$(colordiff -ruN --unidirectional-new-file $1 $2);
  diff_error=$?;

  if [ $diff_error -eq 0 ]; then
    echo "Up to date $1 $2";
  elif [ $diff_error -eq 1 ]; then
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
  else
    echo "
      ERROR: exit $diff_error
      Compare files manually:
        $1
        $2
    "
  fi

  echo ;
  current_items=$((current_items + 1))
  unset IFS;
done
