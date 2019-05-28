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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

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

# Set PATH if go is installed
if [ -d "$GOPATH" ]; then
  export GO111MODULE=on
  PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

