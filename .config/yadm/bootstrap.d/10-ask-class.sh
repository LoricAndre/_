#!/usr/bin/env bash

[ -z $GUI ] && read -r -p 'Enable GUI support [y/N] ? ' GUI

if [[ $GUI =~ [Yy].* ]]; then
  yadm config local.class gui
else
  yadm config local.class nogui
fi
