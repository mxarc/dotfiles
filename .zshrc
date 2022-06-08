source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle sudo
antigen theme spaceship-prompt/spaceship-prompt

# Auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"

export PATH="/usr/local/bin:$PATH"

alias slaptop="$HOME/Code/dotfiles/scripts/layouts/laptop"
alias smonitor="$HOME/Code/dotfiles/scripts/layouts/monitor"
alias smonitor2="$HOME/Code/dotfiles/scripts/layouts/double_monitor"
alias smonitor3="$HOME/Code/dotfiles/scripts/layouts/triple_monitor"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

# flutter
export PATH="$PATH:`pwd`/flutter/bin"

source $ZSH/oh-my-zsh.sh
