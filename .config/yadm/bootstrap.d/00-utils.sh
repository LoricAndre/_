#!/usr/bin/env bash

# Misc utils

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

INFO="${GREEN}[INFO]${NOCOLOR}"
WARNING="${GREEN}[WARNING]${NOCOLOR}"
ERROR="${GREEN}[ERROR]${NOCOLOR}"

info() {
  echo -e "${INFO} $*"
}
warn() {
  echo -e "${WARNING} $*"
}
err() {
  echo -e "${ERROR} $*"
  return
}
