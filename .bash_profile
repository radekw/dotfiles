export PATH=~/.local/bin:$PATH

export PS1='\u@\h:\w\$ '
export CLICOLOR=1
# http://geoff.greer.fm/lscolors/
export LSCOLORS='exgxfxdxcxegedabagacad'

# history settings
# http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTFILESIZE=1048576
export HISTSIZE=1048576
export HISTCONTROL=ignoreboth
export HISTIGNORE="history"
export HISTTIMEFORMAT="[%F %T] "

source ~/.bash_key_bindings
source ~/.bash_aliases

eval "$(starship init bash)"
eval "$(~/.local/bin/mise activate bash)"
