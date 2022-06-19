files=(
  opts
  utils
  prompt
  aliases
  keybindings
)

plugins=(
  fzf-tab
  #zsh-vi-mode
  zsh-syntax-highlighting
  zoxide
  sudo
)

source $ZDOTDIR/loader.zsh

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
[[ "$TMUX" ]] && export FZF_TMUX=1

mkcd() { mkdir -p $@ && cd ${@:$#} }
