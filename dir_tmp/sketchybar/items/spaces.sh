#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8")

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=20
    icon.padding_right=0
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$RED

    # label.color=$GREEN
    # label.highlight_color=$YELLOW
    # label.font="sketchybar-app-font:Regular:18.0"
    # label.y_offset=-1

    background.color=0xff1e1e2e
    background.border_color=0x60494d64
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

space_creator=(
  icon=⎥
  icon.font="$FONT:Heavy:16.0"
  padding_left=10
  padding_right=8
  label.drawing=off
  display=active
  click_script='yabai -m space --create'
  # toggle app's icons
  # script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$WHITE
)

sketchybar --add item space_creator left               \
           --set space_creator "${space_creator[@]}"   \
           --subscribe space_creator space_windows_change
