#!/usr/bin/env bash

info "Logging you into github..."
if gh auth status 1>/dev/null 2>&1; then
  warn "Already logged in, not logging in again."
else
  gh auth login -p ssh -h github.com
  info "Done."
fi
