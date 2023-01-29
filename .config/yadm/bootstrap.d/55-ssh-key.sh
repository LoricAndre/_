#!/usr/bin/env bash

type="ed25519"
path="$HOME/.ssh/${type}"

info "Creating SSH key..."
[ -f "$path" ] && warn "SSH key found at ${path}, exiting." && return

ssh-keygen -t "$type" \
-f "$path" \
-N ''

info "Done."
