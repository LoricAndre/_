#!/usr/bin/env bash

info "Installing packer.nvim..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim || warn "Packer is already installed."
info "Done."

info "Running PackerSync in headless mode..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
info "Done."
