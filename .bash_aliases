alias vi="nvim"
alias v="nvim"
alias cl="clear"
alias less="less -f -r"
alias more="less -f -r"
alias vo='fd --type f --hidden --exclude .git |fzf-tmux -p --reverse |xargs nvim'
alias kc="kubectl"
alias code="code --disable-gpu"
alias kc="kubectl"
alias kcx="kubectx"
alias kns="kubens"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .1="cd ../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .b="cd -"
alias tinit="terraform init"
alias tinitup="terraform init -upgrade"
alias treview="less -R ./plan.log"
alias tunlock='terraform force-unlock -force'
alias l="eza --long --icons --git"
alias ll="eza --long --icons --git"
alias lla="eza --long --icons --git --all"
alias lln="eza --long --icons --git --sort newest"
alias lt="eza --tree --level=2 --long --icons --git"
#alias ll="ls -lh"
#alias lla="ls -lah"
#alias lltr="ls -ltrh"
#alias llatr="ls -latrh"
alias lg="lazygit"
alias aws_clean_creds="unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; unset AWS_SESSION_TOKEN; unset AWS_PROFILE"

function aws_sso_profile() {
  local profile="$1"
  aws configure sso --profile "$profile"
}

function eks_kubeconfig() {
  local cluster_name="$1"
  aws eks update-kubeconfig \
    --name "$cluster_name" \
    --alias "$cluster_name" \
    --user-alias "$cluster_name"
}

function tplan() {
  local cmd="terraform plan -parallelism=10 -compact-warnings -out plan $*"
  eval "$cmd |tee ./plan.log"
}
function tapply() {
  local cmd="terraform apply -parallelism=10 -compact-warnings plan $*"
  eval "$cmd |tee ./apply.log"
}
function tsummary() {
  local plan_file="plan"
  local json_file
  json_file=$(mktemp)
  terraform show -json $plan_file >"$json_file"
  jq -r '
    .resource_changes[]
    | select(.change.actions[0] != "read" and .change.actions[0] != "no-op")
    | [.change.actions[0], .address] | @tsv
  ' "$json_file" | sort
  rm -f "$json_file"
}

function rm_know_host() {
  ssh-keygen -R "$1"
}
function random_string() {
  head /dev/urandom | tr -dc A-Za-z0-9 | head -c "${1:-32}"
  echo ""
}
function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" "$i"
    kubectl -n "$1" get --ignore-not-found "$i"
  done
}

# cc - cd with fuzzy finder
# Usage: cc [path]
function cc {
  local fd_options fzf_options target
  fd_options=(
    --hidden
  )
  fzf_options=(
    --preview='tree -L 1 {}'
    --bind=ctrl-space:toggle-preview
    --exit-0
  )
  target="$(fd . "${1:-.}" "${fd_options[@]}" | fzf "${fzf_options[@]}")"
  test -f "$target" && target="${target%/*}"
  cd "$target" || return 1
}

