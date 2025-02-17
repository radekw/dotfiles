# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    . "${HOME}/.bashrc"
fi

# vi mode
#set -o vi
#bind -m vi-insert 'Control-l: clear-screen'
#bind -m vi-insert 'Control-p: history-search-backward'
#bind -m vi-insert 'Control-n: history-search-forward'

# key bindings
source "${HOME}/.bash_key_bindings"

# init mise-en-place
if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
    eval "$(mise hook-env -s bash)"
fi

# init starship
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

# awscli auto complete
if command -v aws_completer &>/dev/null; then
    complete -C "$(which aws_completer)" aws
fi

# kubectl autocomplete
complete -o default -F __start_kubectl kc

