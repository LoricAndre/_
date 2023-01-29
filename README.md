# My Dotfiles

## Requirements
These dotfiles rely on [yadm](https://yadm.io/) for easier management and bootstrapping.

## Setup
- Install yadm, or alternatively use `source <(curl -L bootstrap.yadm.io)` to dynamically load it (it will be installed automatically during bootstrap).
- Run `yadm clone <https repo url>` (for this repo, `yadm clone https://github.com/LoricAndre/_`) and answer `yes` when asked if it should run the bootstrap script.
- Once this is done, log out then in again, which should make you use a properly configured zsh.
- Run `yadm alt`, as there apparently are issues with env vars when ran from bash.

## Included
### With config files
- Neovim
- Mako
- ZSH
- Hyprland
- YADM itself
- fontconfig

### With setup during bootstrap
- GitHub CLI

### Only installed
See `.config/yadm/packages*`
