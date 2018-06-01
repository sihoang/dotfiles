export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Add Go
if [ -s "$HOME/go/bin" ]
then
  export GOPATH="$HOME/go"
  export GOROOT="$(brew --prefix golang)/libexec"
  export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
	test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export ETHEREUM_DIR="$HOME/Library/Ethereum"
export RINKEBY_DIR="$ETHEREUM_DIR/rinkeby"

