#!/usr/bin/env bash
trizen --version >/dev/null && return
target="/tmp/trizen"
info "Installing trizen..."
info "Updating packages..."
sudo pacman -Syu
info "Done updating packages."
git clone https://aur.archlinux.org/trizen.git "${target}" || warn "Failed to clone repo to ${target}"
cd /tmp/trizen || err "Failed to cd to ${target}"
makepkg -si
cd - >/dev/null || warn "Failed to get back to previous directory."
info "Deleting ${target} dir..."
rm -rf "${target}"
info "Done deleting target dir."
info "Done installing trizen."
