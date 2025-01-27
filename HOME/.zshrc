# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

alias ls=eza

# points to shell script designed to source/unsource env variables from env files hierarchically
alias sh-load-env=/usr/local/bin/load-env

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Created by `pipx` on 2024-09-07 23:46:32
#export PATH="$PATH:/Users/musicpulpite/.local/bin"
#export PATH="$PATH:$HOME/go/bin"

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# https://direnv.net/
eval "$(direnv hook zsh)"

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

