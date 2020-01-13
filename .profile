# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  export PATH="$PATH:$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi


# Nodejs installed by nvm
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  # add --no-use to work workaround the slow startup
  source "$NVM_DIR/nvm.sh" --no-use
  # assume the nvm alias default is set
  NVM_NODE="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin"
  [ -d "$NVM_NODE" ] && export PATH="$PATH:$NVM_NODE"
fi

# Nodejs installed by package managers
# npmrc: prefix = ${HOME}/.npm-packages 
if [ -d "$HOME/.npm-packages/bin" ]; then
  export PATH="$PATH:$HOME/.npm-packages/bin"
fi


# Install Go manually from tar https://golang.org/doc/install#tarball
if [ -d "/usr/local/go" ]; then
  export GOROOT="/usr/local/go"
fi

# brew install go
if [ -d "/usr/local/opt/go" ]; then
  export GOROOT="/usr/local/opt/go/libexec"
fi

# pacman -S go
if [ -d "/usr/lib/go" ]; then
  export GOROOT="/usr/lib/go"
fi

# dnf install golang
if [ -d "/usr/lib/golang" ]; then
  export GOROOT="/usr/lib/golang"
fi

# Set PATH if go is installed
if [ -d "$GOROOT" ]; then
  export GO111MODULE=on
  export GOPATH="$HOME/go"
  test -d "$GOPATH" || mkdir "$GOPATH"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
  . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi


# Add Rust which is installed via the default rustup
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi


# Java
if [ -d "$HOME/.jenv/bin" ]; then
  export PATH="$PATH:$HOME/.jenv/bin"
fi


# Android on MacOS
if [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
fi

# Android on Linux
if [ -d "$HOME/Android/Sdk" ]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
fi

if [ -d "$ANDROID_HOME" ]; then
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi
