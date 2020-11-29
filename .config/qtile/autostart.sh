#! /bin/bash
picom &
nitrogen --restore &
xrandr --output DP-2 --mode 2560x1440 --pos 0x0 --rotate normal\
    --output DVI-D-0 --mode 1920x1080 --pos 2560x360 --rate 144.00 --rotate normal &
