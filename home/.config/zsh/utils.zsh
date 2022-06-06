mkcd() { NAME=$1; mkdir -p "$NAME"; cd "$NAME"; }

function plugsup {
  plugins=(
    Aloxaf/fzf-tab
    zsh-users/zsh-syntax-highlighting
  )
  for plugin in $plugins; do
  if [[ -d "~/.local/share/zsh/plugins/$(echo \"${plugin#*/}\")" ]]; then
    cd ~/.zsh/plugins/$(echo "${plugin#*/}")
    git pull
    cd -
  else
    git clone https://github.com/$plugin \
    ~/.local/share/zsh/plugins/$(echo "${plugin#*/}")
  fi
  done
}

function 256 { for acc in $(seq 0 16 240); do for i in $(seq 1 16); do printf \
"\033[38;5;$(expr $acc + $i)m%4s" "$(expr $acc + $i)"; done; done; }
