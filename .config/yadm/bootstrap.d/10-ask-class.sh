#!/usr/bin/env bash

if [ -e /.dockerenv ]; then
  yadm config local.class docker
else

  read -r -p 'Enable GUI support [y/N] ? ' GUI || GUI=N

  if [[ $GUI =~ [Yy].* ]]; then
    yadm config local.class gui
  else
    yadm config local.class nogui
  fi
fi
