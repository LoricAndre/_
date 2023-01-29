#!/usr/bin/bash

. ../vars.sh
./lock.tpl && chmod +x lock

ln -sf "$(pwd)" "$HOME/bin"
