function preexec() {
  # this will print expanded command
  [ $1 != $2 ] && print -r "> $2"
}

alias tb="nc termbin.com 9999"
alias tree="lsd --tree"
alias nix='noglob nix'
alias l='lsd -l'
alias ll='lsd -lA'
alias la='ll'

alias menc='sudo cryptsetup open /dev/disk/by-label/enchdd enchdd \
  && sudo mount /dev/mapper/enchdd ~/run/enchdd'
alias umenc=' sudo umount /dev/mapper/enchdd \
  && sudo cryptsetup close enchdd'

alias nrs="sudo nixos-rebuild switch"

alias gcl="git clone"

