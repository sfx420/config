source ~/.config/zgen/zgen.zsh

if ! zgen saved; then
  # load oh my zsh
  # zgen load yous/lime
  zgen load S1cK94/minimal minimal
  zgen save
fi

# vim: ft=sh