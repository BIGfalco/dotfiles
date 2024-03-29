#!/bin/bash
set -euo pipefail

source tools/echos.sh

readonly DOT_FILES=( .zshrc .zinit .p10k.zsh )

for file in ${DOT_FILES[@]}; do
  dest=${HOME}/${file}
  if [ -e ${dest} ]; then
    warn "[warn] ${dest}: skipped (already exists)"
  else
    ln -s $HOME/dotfiles/$file $dest
    ok "[ ok ] ${dest}: created"
  fi
done

ok "Complete!"
