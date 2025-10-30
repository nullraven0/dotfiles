# -------------------------------------------------------------------
# Powerlevel10k instant prompt — keep this block at the very top.
# Anything that may ask for input must go ABOVE this block.
# -------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins managed by Oh My Zsh (safe to keep here even if we also source explicitly)
plugins=(git)


# Oh My Zsh core
source "$ZSH/oh-my-zsh.sh"

# -------------------------------------------------------------------
# Plugins not installed inside $ZSH_CUSTOM — source explicitly.
# Arch package path for zsh-autosuggestions:
# -------------------------------------------------------------------
# (Silent; should not print anything — safe for instant prompt.)
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Powerlevel10k configuration (keep near the end)
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---------------------
# User configuration
# ---------------------
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
# export ARCHFLAGS="-arch $(uname -m)"

# History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- Eza (better ls) -----

alias ls="eza --icons=always"
alias ll="eza --icons=always -l"
alias la="eza --icons=always -a"
alias lt="eza --icons=always --tree"

# zoxide (better cd)
eval "$(zoxide init zsh)"
# to always use zoxide
alias cd="z"

# 🌙 Turn On: Starts gammastep in the background to set the temperature
alias nighton='nohup gammastep -O 3500 >/dev/null 2>&1 & disown'

# ☀️ Turn Off: Kills all running gammastep processes, which automatically restores the default color
alias nightoff='killall gammastep'


# Zsh Syntax Highlighting (must be LAST)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

