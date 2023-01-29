export GOPATH=$HOME/.local/share/go
export PATH=$HOME/bin:$HOME/.local/bin:/opt/texlive/2020/bin/x86_64-linux:$PATH:$HOME/.npm-packages/bin:/usr/lib/ruby/gems/2.7.0:$HOME/.gem/ruby/2.7.0:$HOME/.cargo/bin:$GOPATH/bin
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export VIMRUNTIME=/usr/share/nvim/runtime


# Fix keys
typeset -g -A key
set -o emacs
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        history-search-backward
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      history-search-forward
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\033[127;5u" backward-kill-word
bindkey -r "^[j"
bindkey -r "^[k"
bindkey -r "^[l"
bindkey -r "^[m"

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


fpath=($fpath "/home/loric/.zfunctions")
autoload -U promptinit; promptinit


[ -z $ZDOTDIR ] && ZDOTDIR=$HOME/.config/zsh/
. $ZDOTDIR/*
