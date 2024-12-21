#!/bin/bash


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

    background.color=$BG1
    background.border_color=$BG2
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




# #!/usr/bin/env bash
#
# source "$HOME/.config/sketchybar/variables.sh" # Loads all defined colors
#
# sketchybar --add item spacer.1 left \
# 	--set spacer.1 background.drawing=off \
# 	label.drawing=off \
# 	icon.drawing=off \
# 	width=10
#
# for i in "${!SPACE_ICONS[@]}"; do
# 	sid=$((i + 1))
# 	sketchybar --add space space.$sid left \
# 		--set space.$sid associated_space=$sid \
# 		label.drawing=off \
# 		icon.padding_left=10 \
# 		icon.padding_right=10 \
# 		background.padding_left=-5 \
# 		background.padding_right=-5 \
# 		script="$PLUGIN_DIR/space.sh"
# done
#
# sketchybar --add item spacer.2 left \
# 	--set spacer.2 background.drawing=off \
# 	label.drawing=off \
# 	icon.drawing=off \
# 	width=5
#
# sketchybar --add bracket spaces '/space.*/' \
# 	--set spaces background.border_width="$BORDER_WIDTH" \
# 	background.border_color="$RED" \
# 	background.corner_radius="$CORNER_RADIUS" \
# 	background.color="$BAR_COLOR" \
# 	background.height=26 \
# 	background.drawing=on
#
# sketchybar --add item separator left \
# 	\
# 	icon.font="$FONT:Regular:16.0" \
# 	background.padding_left=26 \
# 	background.padding_right=15 \
# 	label.drawing=off \
# 	associated_display=active \
# 	icon.color="$YELLOW" # --set separator icon= \
