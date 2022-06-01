autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%b %a'
zstyle ':vcs_info:*' formats $'\uE0A0 ''%b %a'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PROMPT='
%F{3}%~%f %F{7}${vcs_info_msg_0_}%f
%(?..%F{red})λ%f '

# https://www.zsh.org/mla/users/2019/msg00633.html
# https://github.com/romkatv/powerlevel10k/issues/888#issuecomment-657969840
function zle-line-init() {
  echoti smkx
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT
  PROMPT=' λ '
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi
  return ret
}

function zle-line-finish() {
  echoti rmkx
}

zle -N zle-line-init
zle -N zle-line-finish
