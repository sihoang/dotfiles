
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases
# -------
alias ls="ls -GF"
alias lgeth="geth --rpc --rpcapi eth,net,admin,personal"
alias ageth="geth attach http://localhost:8545"
 
