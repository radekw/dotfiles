# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.nix-profile/bin:${HOME}/.npm-global/bin:${PATH}"
export EDITOR=nvim
export PS1='\u@\h:\w\$ '

# disable autologout
unset autologout

# history settings
# http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTFILESIZE=5242880
export HISTSIZE=5242880
export HISTCONTROL=ignoreboth
export HISTIGNORE='cd -:set *:[bf]g:jobs:exit:pwd:clear:top:htop:history:export AWS_+(ACCESS|SECRET|SESSION)_*'
export HISTTIMEFORMAT="$(echo -e '\e[0;32m')[%F %T] $(echo -e '\e[0;37m')"

# aliases
source "${HOME}/.bash_aliases"

