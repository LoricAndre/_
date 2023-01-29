#!/bin/bash

cat > lock << EOF
#!/bin/bash
lock_x11() {
  i3lock-fancy --clock \\
    \\ \# -i /home/loric/wallpapers/active.png \\
    --indicator \\
    --pass-screen-keys --pass-volume-keys \\
    --insidevercolor="${color_2}" --insidecolor=00000000 \\
    --insidewrongcolor="${color_1}" --ringvercolor="${color_4}" \\
    --ringwrongcolor="${color_1}" --ringcolor="${color_6}" \\
    --line-uses-inside --keyhlcolor="${color_4}" \\
    --timecolor="${color_0}" --veriftext="" \\
    --wrongtext="" --radius=100 \\
    --veriftext="" --noinputtext="" \\
    --locktext=""
}

lock_wl() {
  waylock \\
    --init-color "#${color_bg}" \\
    --fail-color "#${color_2}" \\
    --input-color "#${color_9}"
}

if [[ \${XDG_SESSION_TYPE} == wayland ]]; then
  lock_wl
else
  lock_x11
fi
EOF
