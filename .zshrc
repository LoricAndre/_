export GOPATH=$HOME/.local/share/go
export PATH=$HOME/bin:$HOME/.local/bin:/opt/texlive/2020/bin/x86_64-linux:$PATH:$HOME/.npm-packages/bin:/usr/lib/ruby/gems/2.7.0:$HOME/.gem/ruby/2.7.0:$HOME/.cargo/bin:$GOPATH/bin
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export VIMRUNTIME=/usr/share/nvim/runtime

# History
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# Compinit
fpath=($HOME/bin /usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

for f in $HOME/.config/zsh/*.zsh; do
  [ -f "${f}" ] && source "${f}"
done
