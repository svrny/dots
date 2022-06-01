export VISUAL=nvim
export EDITOR=nvim

export MOZ_ENABLE_WAYLAND=1
export BAT_THEME=OneHalfDark
export FZF_DEFAULT_COMMAND='fd -tf'

export FZF_DEFAULT_OPTS=' --height 40% --layout reverse --border sharp
  --color "prompt:33,pointer:33,hl:33,info:33,spinner:33,border:237"'

export BEMENU_OPTS="-ibns --fn 'Cascadia Code 10' -p ' $ '
  --tf '#61afef' --ff '#abb2bf' --nf '#abb2bf' --hf '#61afef' --sf '#abb2bf'"

if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
