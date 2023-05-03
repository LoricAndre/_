alias c = clear
alias ... = ../..
alias .... = ../../..
alias l = ls
alias ll = ls -l
alias la = ls -al

alias wc = uu-wc
alias yes = uu-yes
alias dd = uu-dd
alias du = uu-du
alias df = uu-df

alias :qa = exit
alias :q = clear
alias reboot = sudo reboot
alias shutdown = sudo shutdown

alias py = python3
alias tz = trizen
def in-path [e: string] {
  (which $"($e)" | length) > 0
}
def cat [...all] {
  if (in-path bat) {
    bat $all
  } else {
    cat $all
  }
}
def mcd [dir: path] {
  mkdir $dir
  cd $dir
}
def top [] {
  if (in-path btm) {btm} else {top}
}

alias dkc = docker-compose
alias dk = docker
alias k = kubectl
alias ktx = kubectx
alias kns = kubens

def n [d: path = '.'] {
  cd $d
  nvim $d
  cd -
}
def "date iso" [] {
  $in | date format "%Y-%m-%d_%H:%M:%S"
}

alias wthr = curl https://wttr.in
alias bashupload = curl https://bashupload.com -T
alias tf = terraform
alias gn = n +"Telescope repo list"
alias :e = n

alias pipr = python -m pip install -r

