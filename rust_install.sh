#!/bin/bash
set -euo pipefail

source tools/echos.sh

function command_exists() {
  type "$1" &> /dev/null ;
}

: "install Rust" && {
  if ! command_exists cargo; then
    info "Rust install ..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
  else
    warn "Rust is already installed"
  fi
}

: "install Rust tool" && {
  packages=( bat navi fd-find ripgrep )
  for package in ${packages[@]}; do
    if ! command_exists $package; then
      info "installing ${package}..."
      cargo install ${package}
    else
      warn "${package} is already installed"
    fi
  done
}
