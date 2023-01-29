#!/usr/bin/env bash

type="ed25519"
ssh_key_path="$HOME/.ssh/id_${type}"

info "Creating SSH key..."
[ -f "$ssh_key_path" ] && warn "SSH key found at ${ssh_key_path}, exiting." && return

ssh-keygen -t "$type" \
-f "$ssh_key_path" \
-N ''

info "Done."
