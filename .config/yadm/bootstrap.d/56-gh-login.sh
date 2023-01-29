#!/usr/bin/env bash

info "Logging you into github..."
gh auth status 1>/dev/null 2>&1 && warn "Already logged in, exiting." && return
yes | gh auth login -p ssh -h github.com
info "Done."
