#!/usr/bin/env bash

l=($(cat "${packages}" "${packages}.extra"))
info "Installing packages..."
trizen -S --needed --noconfirm "${l[@]}"
info "Done."
