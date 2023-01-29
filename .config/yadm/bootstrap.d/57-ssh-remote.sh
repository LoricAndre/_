#!/usr/bin/env bash

cd "$HOME"
info "Setting origin to SSH remote..."
old_remote="$(yadm remote get-url origin)"
new_remote="$(echo $old_remote | sed 's#https://#git@#;s#/#:#')"

yadm remote set-url origin "$new_remote"
cd - >/dev/null || warn "Failed to get back to previous directory."
info "Done."
