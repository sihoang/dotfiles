if [ "$PROFILE_SOURCED" != "true" ]; then
  export PROFILE_SOURCED=true
  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
fi


#######
### Source again when entering tmux
#######

# Need to trigger this everytime entering tmux
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
