autoload -U promptinit; promptinit

# # Prompt & more
# function preexec() {
#   timer=$(($(date +%s%3N)))
# }
#
# function precmd() {
#   if [ $timer ]; then
#     now=$(($(date +%s%3N)))
#     ms=$(($now-$timer))
#     to_m=$((ms / 60000))
#     s=$(bc <<< "scale=2; ($ms - $to_m * 60000) / 1000")
#     h=$((to_m / 60))
#     m=$((to_m - 60*h))
#     t="$s"
#     if (( m > 0 )); then
#       t="$m:$t"
#       if (( h > 0 )); then
#         t="$h:$t"
#       fi
#     fi
#     export RPROMPT="%F{cyan} ${t}s %{$reset_color%}"
#     unset timer
#   else
#     export RPROMPT=""
#   fi
# }
#
_battery() {
  dir="/sys/class/power_supply/BAT0"
  if [ -d "$dir" ]; then
    _label=$(\cat "$dir/capacity")
    _status=$(\cat "$dir/status")
  else
    return 2
  fi
  if [[ $_status != Charging ]]; then
    if (( $_label == 100 )); then
      icon=" "
    elif (( $_label >= 90 )); then
      icon=" "
    elif (( $_label >= 80 )); then
      icon=" "
    elif (( $_label >= 70 )); then
      icon=" "
    elif (( $_label >= 60 )); then
      icon=" "
    elif (( $_label >= 50 )); then
      icon=" "
    elif (( $_label >= 40 )); then
      icon=" "
    elif (( $_label >= 30 )); then
      icon=" "
    elif (( $_label >= 20 )); then
      icon=" "
    elif (( $_label >= 10 )); then
      icon=" "
    else icon=" "
    fi
  else
    icon=" "
  fi
  printf "%s%s%%" "$icon" "$_label"
}

_clock() {
  _d=$(date "+%H:%M")
  printf "%s" "$_d"
}

export RPROMPT='%F{cyan}$(_battery)%%  $(_clock) %F{$reset_color%}'

set -o PROMPT_SUBST
export PROMPT='%B%F{blue}%~ %F{yellow}$(git symbolic-ref --short HEAD 2> /dev/null) %(?.%F{green}.%F{red}✗)%f%b '
set -o monitor
