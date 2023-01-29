#!/usr/bin/env bash

mapfile l < "$packages"
info "Installing packages..."
trizen -S --needed "${l[@]}"
info "Done."
