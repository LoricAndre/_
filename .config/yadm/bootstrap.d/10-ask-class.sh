#!/usr/bin/env bash

read -r -p 'Enable GUI support [y/N] ?' gui

if [[ $gui =~ [Yy].* ]]; then
  yadm config local.class gui
else
  yadm config local.class nogui
fi
