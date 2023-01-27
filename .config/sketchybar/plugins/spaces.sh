#!/bin/bash

source $HOME/.config/sketchybar/vars.sh

sketchybar --set $NAME\
                 icon.highlight=$SELECTED\
                 background.drawing=$SELECTED

if [[ $SELECTED == true ]]; then
  sketchybar --set space_name_$DID\
                   icon.drawing=off\
                   label=$NAME\
                   label.color=$MAIN_COLOR\
                   label.padding_left=24\
                   label.padding_right=24\
                   background.padding_right=16\
                   background.padding_left=16\
                   background.color=0xFFFFFFFF\
                   associated_display=$DID
fi
