#!/usr/bin/env bash

cd "$HOME" || err "Failed to cd to $HOME"

info "Initializing submodules..."
yadm submodule update --recursive --init
info "Done."
