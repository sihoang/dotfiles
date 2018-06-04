# Reset PATH when entering nested shell i.e. tmux
if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
