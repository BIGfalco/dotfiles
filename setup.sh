#!/bin/bash
set -euo pipefail

source tools/echos.sh

function command_exists() {
  type "$1" &> /dev/null ;
}

: "install packages by apt" && {
  info "apt update..."
  apt update -y
  packages=( curl wget zsh )
  for package in ${packages[@]}; do
    if ! command_exists $package; then
      info "installing ${package}..."
      apt install -y ${package}
    else
      warn "${package} is already installed"
    fi
  done
}

: "install fzf" && {
  if ! command_exists fzf; then
    info "fzf install ..."
    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  else
    warn "fzf is already installed"
  fi
}

ok "Complete!"
