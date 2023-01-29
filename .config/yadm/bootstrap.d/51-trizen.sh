#!/usr/bin/env bash
info "Installing trizen..."
trizen --version >/dev/null && warn "Trizen already installed, exiting." && return
target="/tmp/trizen"
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
