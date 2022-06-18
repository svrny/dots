export VISUAL=nvim
export EDITOR=nvim

export MOZ_ENABLE_WAYLAND=1
export BAT_THEME=OneHalfDark
export FZF_DEFAULT_COMMAND='fd -tf'
export FZF_TMUX_OPTS='-p'

export FZF_DEFAULT_OPTS='
  --color "prompt:4,pointer:4,hl:4,info:4,spinner:4,border:7"
  --height 40%
  --layout reverse
  --border sharp'

#if [ "$(tty)" = "/dev/tty1" ]; then
#  exec sway
#fi
