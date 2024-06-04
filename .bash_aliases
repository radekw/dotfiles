alias vi=nvim
alias v=nvim
alias vo='fd --type f --hidden --exclude .git |fzf-tmux -p --reverse |xargs nvim'
alias cl='clear'
alias kc=kubectl
#alias ll="ls -l"
#alias lla="ls -la"
#alias lltr="ls -ltr"
#alias llatr="ls -latr"
alias ll="eza --long --icons --git"
alias lla="eza --long --icons --git -all"
alias llt="eza --tree --level=2 --long --icons --git"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

cx() { cd "$@" && l; }
