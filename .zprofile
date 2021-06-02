# [MacOS only] Load the default .profile and brew
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

if [ -d "/opt/homebrew/bin" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
  export PATH="$PATH:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin"
  export FPATH="$FPATH:$HOMEBREW_PREFIX/share/zsh/site-functions"
  #https://github.com/ohmyzsh/ohmyzsh/issues/6835
  export ZSH_DISABLE_COMPFIX=true
fi
