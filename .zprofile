if [ "$PROFILE_SOURCED" != "true" ]; then
  export PROFILE_SOURCED=true
  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
fi


#######
### Source again when entering tmux
#######

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
