# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="vim"

export BROWSER="chrome"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~
setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/.local/bin
    $HOME/go/gin
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

# Add new homebrew path (https://earthly.dev/blog/homebrew-on-m1/)
eval "$(/opt/homebrew/bin/brew shellenv)"

# ~~~~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~
# REMEMBER: to load OPENAI env variables using /usr/local/bin/load-env helper shell script

alias ls='eza --ignore-glob=".git|.git/*"'

# points to shell script designed to source/unsource env variables from env files hierarchically
alias sh-load-env=/usr/local/bin/load-env

fd() {
  # find all child directories of the current working directory (or directory argument)
  # (ignore child directories that match any of the blob patterns stored in the FD_IGNORE env var)
  # then use fzf to fuzzy search through these results
  # then cd into the selected directory
  local dir

  local start_path=${1:-.}

  local FD_IGNORE=${FD_IGNORE:-"*/node_modules/*|*/.git/*|*/dist/*|*/.terragrunt-cache/*"}
  local ignore_patterns=()
  IFS='|' read -rA ignore_patterns <<< "$FD_IGNORE"
  ignore_patterns=("${ignore_patterns[@]/#/\"}")
  ignore_patterns=("${ignore_patterns[@]/%/\"}")
  local ignore_args=${(j: -o -path :)ignore_patterns}

  find_cmd="find $start_path -type d \( -path ${ignore_args[@]} -o -false \) -prune -o -type d -print"

  dir=$(eval $find_cmd | fzf +m) &&
  cd "$dir"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# Created by `pipx` on 2024-09-07 23:46:32
#export PATH="$PATH:/Users/musicpulpite/.local/bin"
#export PATH="$PATH:$HOME/go/bin"

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# https://direnv.net/
eval "$(direnv hook zsh)"

# source private zsh config (if present)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

cat << 'EOF'
.----------------------------------------------------------------------.
| _       __     __                               __               __  |
|| |     / /__  / /________  ____ ___  ___       / /_  ____ ______/ /__|
|| | /| / / _ \/ / ___/ __ \/ __ \__ \/ _ \     / __ \/ __ \/ ___/ //_/|
|| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/    / /_/ / /_/ / /__/ ,<   |
||__/|__/\___/_/\___/\____/_/ /_/ /_/\___/    /_.___/\__,_/\___/_/|_|  |
|| |     / (_) / (_)___ _____ ___                                      |
|| | /| / / / / / / __ \/ __ \__ \                                     |
|| |/ |/ / / / / / /_/ / / / / / /                                     |
||__/|__/_/_/_/_/\__,_/_/ /_/ /_/                                      |
'----------------------------------------------------------------------'
EOF
