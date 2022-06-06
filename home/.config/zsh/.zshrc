# vim:foldmethod=marker:foldlevel=0:
# Opts {{{
autoload -U compinit && compinit
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 1
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
setopt EXTENDED_GLOB
# }}}

# Imports {{{
source $ZDOTDIR/utils.zsh
source $ZDOTDIR/keybindings.zsh

local PLUGINS="${HOME}/.local/share/zsh/plugins"
source $PLUGINS/fzf-tab/*.plugin.zsh
source $PLUGINS/zsh-syntax-highlighting/*.plugin.zsh

eval "$(zoxide init zsh --cmd cd)"
# }}}

# Prompt {{{
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%b %a'
zstyle ':vcs_info:*' formats $'\uE0A0 ''%b %a'
precmd () { vcs_info }

set-long-prompt() {
  PROMPT='%(?..[%F{red}%?%f] )%F{4}%~%f %F{2}${vcs_info_msg_0_}%f%Bλ%b%f '
}

precmd_functions=(set-long-prompt)
set-short-prompt() { PROMPT='λ '; zle .reset-prompt }
zle-line-finish() { set-short-prompt }
zle -N zle-line-finish
trap 'set-short-prompt; return 130' INT
# }}}

# Aliases {{{
alias tb="nc termbin.com 9999"
alias tree="lsd --tree"
alias nix='noglob nix'
alias l='lsd -l'
alias ll='lsd -la'
alias la='ll'
# }}}

# Fzf {{{
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

if [[ "$TMUX" ]]; then
  export FZF_TMUX=1
fi
# }}}

# Zsh syntax highlight {{{
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=243"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=243"
# }}}
