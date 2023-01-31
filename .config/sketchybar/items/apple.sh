#!/bin/sh

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item           apple.logo left                             \
           --set apple.logo     icon=$APPLE                                 \
                                icon.font="$FONT:Black:16.0"                \
                                icon.color=$BLUE_YABAI                      \
                                padding_right=15                            \
                                label.drawing=off                           \
                                click_script="$POPUP_CLICK_SCRIPT"          \
                                                                            \
           --add item           apple.prefs popup.apple.logo                \
           --set apple.prefs    icon=$PREFERENCES                           \
                                label="Preferences"                         \
                                click_script="open -a 'System Preferences';
                                              $POPUP_OFF"                   \
                                                                            \
           --add item           apple.activity popup.apple.logo             \
           --set apple.activity icon=$ACTIVITY                              \
                                label="Activity"                            \
                                click_script="open -a 'Activity Monitor';
                                              $POPUP_OFF"                   \
                                                                            \
           --add item           apple.lock popup.apple.logo                 \
           --set apple.lock     icon=$LOCK                                  \
                                label="Lock Screen"                         \
                                click_script="pmset displaysleepnow;
                                              $POPUP_OFF"                   \
                                                                            \
           --add item           apple.kitty popup.apple.logo                \
           --set apple.kitty     icon=$TERMINAL                             \
                                label="Kitty"                               \
                                click_script="open -a 'kitty.app';
                                              $POPUP_OFF"                   \
                                                                            \
           --add item           apple.discord popup.apple.logo              \
           --set apple.discord     icon=$DISCORD                            \
                                label="Discord"                             \
                                click_script="open -a 'Discord PTB.app';
                                              $POPUP_OFF"                   \
                                                                            \
           --add item           apple.brave popup.apple.logo                \
           --set apple.brave     icon=$BROWSER                              \
                                label="Brave"                               \
                                click_script="open -a 'Brave.app';
                                              $POPUP_OFF"