# Reset PATH when entering nested shell i.e. tmux
if [ -f /etc/profile ]; then
  PATH=""

  # For Ubuntu, must source the system path first
  [ -f /etc/environment ] && source /etc/environment

  source /etc/profile
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
