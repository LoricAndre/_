alias c=clear

mcd() {
  mkdir -p $@ && cd $@
}

nalias() {
  echo "alias $1='$2'" >> $HOME/.config/zsh/aliases.zsh
}

alias h='history'

alias ..='cd ..'
alias ...='cd ...'
alias ...='cd ../..'

top() {
  btm || \top
}

alias s='status'
alias :qa='exit'
alias :q='clear'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'
alias mkdir="mkdir -p"

alias py='python3'
cat() {
  bat || \cat
}

alias mkdir='mkdir -p'

alias dkc='docker-compose'
alias dk='docker'
alias k='kubectl'
alias ktx=kubectx
alias kns=kubens
kgt() {
  res=`kubectl get $1 -o wide --no-headers=true | fzf --preview "kubectl get $1 {1} -o yaml" | awk '{print $1}'`
  kubectl get "$1" "$res" -o yaml | cat
}

n() {
  [[ -d $1 ]] && cd $1 && nvim && cd - || nvim $@
}

fcd() {
  cd "$(z | fzf --preview='exa -l {+2}' --nth=2 | awk '{print $2}')"
}

fn() {
  d=$(z | fzf --tac | awk '{print $2}')
  [[ -z $d ]] && return
  echo $d
  n $d
}

open() {
  for a in "$@"; do
    xdg-open $a >/dev/null 2>&1
  done
}

nohd() {
  nohup $@ >/dev/null 2>&1 &
}

cl() {
  cd $1
  ls
}

alias wthr='curl https://wttr.in'
alias lwd='source ~/.cache/zsh/lwd'
alias bashupload='curl https://bashupload.com -T'


alias tf='terraform'
alias gn='n +"Telescope repo list"'
alias :e='n'

xdg-open() {
  [ -z $(uname -r | grep WSL) ] && \xdg-open $@ || powershell.exe -c start $@
}

vnmap() {
  nmap -Pn -sV --script vuln $@ | grep -C1 VULNERABLE | grep IDs | sed -n 's/^.*IDs:.*:\(.*\)$/\1/p'
}

alias pipr='pip install -r'
