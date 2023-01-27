#!/usr/bin/env sh
source $HOME/.config/sketchybar/vars.sh

sketchybar --set $NAME icon=""\
                       icon.color=$MAIN_COLOR\
                       label="$(date '+%a %d %b  %H:%M')"\
                       label.color=$MAIN_COLOR\
                       background.padding_right=0\
                       background.padding_left=16\
                       background.color=0xFFFFFFFF