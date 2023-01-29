#!/usr/bin/env bash

info "Logging you into github..."
if gh auth status 1>/dev/null 2>&1; then
  warn "Already logged in, not logging in again."
else
  (yes | gh auth login -p ssh -h github.com -s admin:public_key)
fi
info "Adding SSH key..."
if ! gh auth status | grep 'admin:public_key'; then
  gh auth refresh -h github.com -s admin:public_key
fi
gh ssh-key add "${ssh_key_path}.pub"
info "Done."
