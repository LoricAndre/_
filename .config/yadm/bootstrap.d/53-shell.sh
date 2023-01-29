#!/usr/bin/env bash

s=$(chsh -l | grep -e "/${shell}\$" | tail -n1)
info "Setting shell to $s..."
sudo chsh -s "$s" "$USER"
info "Done."

