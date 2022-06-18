autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%b %a'
zstyle ':vcs_info:*' formats $'\uE0A0 ''%b %a'
precmd () { vcs_info }

function set-long-prompt() {
  PROMPT='%F{4}%~%f %Bλ%b%f '
  RPROMPT='%F{2}${vcs_info_msg_0_}%f%(?..[%F{red}%?%f])'
}

function set-short-prompt() {
  PROMPT='λ '
  RPROMPT=''
  zle .reset-prompt
}

precmd_functions=(set-long-prompt)

function zle-line-finish() {
  set-short-prompt
 echoti smkx
}

zle -N zle-line-finish

trap 'set-short-prompt; return 130' INT
