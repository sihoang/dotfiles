# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH used by brew
if [ -d "/usr/local/sbin" ] ; then
    PATH="/usr/local/sbin:$PATH"
fi

# node and nvm stuff
# workaround with --no-use flag to load faster
DEFAULT_NODE_VERSION="12.13.0"
if [ -d "$HOME/.nvm/versions/node/v$DEFAULT_NODE_VERSION/bin"  ] ; then
  PATH="$HOME/.nvm/versions/node/v$DEFAULT_NODE_VERSION/bin:$PATH"
fi
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh" --no-use
fi


# Install Go manually from tar https://golang.org/doc/install#tarball
if [ -d "/usr/local/go" ]; then
  export GOPATH="$HOME/go"
  export GOROOT="/usr/local/go"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
fi


# brew install go
if [ -d "/usr/local/opt/go" ]; then
  export GOPATH="$HOME/go"
  export GOROOT="/usr/local/opt/go/libexec"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
fi


# pacman -S go
if [ -d "/usr/lib/go" ]; then
  export GOPATH="$HOME/go"
  export GOROOT="/usr/lib/go"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
fi


# dnf install golang
if [ -d "/usr/lib/golang" ]; then
  export GOPATH="$HOME/go"
  export GOROOT="/usr/lib/golang"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
fi


# Set PATH if go is installed
if [ -d "$GOPATH" ]; then
  export GO111MODULE=on
  PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
  . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi


# Add Rust which is installed via the default rustup
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi


# Java
if [ -d "$HOME/.jenv/bin" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi


# Android on MacOS
if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
  export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
fi


# Android on Linux
if [ -d "$HOME/Android/Sdk/platform-tools" ]; then
  export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi
