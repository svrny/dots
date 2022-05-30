autoload -U compinit && compinit
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '$HOME/zc'
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
disable -p '#'

local ZSH="${HOME}/.zsh"
local CORE="${ZSH}/core"
local PLUGINS="${ZSH}/plugins"

source $CORE/aliases.zsh
source $CORE/utils.zsh
source $CORE/keybindings.zsh
source $CORE/prompt.zsh

source $PLUGINS/fzf-tab/*.plugin.zsh
source $PLUGINS/zsh-syntax-highlighting/*.plugin.zsh

# Fzf -------------------------------- #
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
# ------------------------------------ #


# Zsh syntax highlight --------------- #
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=243"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=243"
