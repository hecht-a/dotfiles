#!/bin/bash

source $HOME/.config/sketchybar/vars.sh

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ ${CHARGING} != "" ]]; then
  ICON=""
else
  case ${BATT_PERCENT} in
    100) ICON="" ;;
    9[0-9]) ICON="" ;;
    8[0-9]) ICON="" ;;
    7[0-9]) ICON="" ;;
    6[0-9]) ICON="" ;;
    5[0-9]) ICON="" ;;
    4[0-9]) ICON="" ;;
    3[0-9]) ICON="" ;;
    2[0-9]) ICON="" ;;
    1[0-9]) ICON="" ;;
    *) ICON=""
  esac
fi

sketchybar --set ${NAME}\
                 icon=$ICON\
                 icon.color=$MAIN_COLOR\
                 label="${BATT_PERCENT}%"\
                 label.color=$MAIN_COLOR\
                 background.drawing=on\
                 background.color=$ACCENT_COLOR
