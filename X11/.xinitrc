#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --dpi 288 # Change this to your true dpi (https://duckduckgo.com/?q=dpi+calculator) (http://ncalculators.com/multiplication-table/24.htm)
redshift &
xbindkeys &
feh --bg-scale /home/ctjhoa/wallpapers/gits.png

export _JAVA_AWT_WM_NONREPARENTING=1
export GDK_SCALE=2
export SWT_GTK3=0

# Statusbar loop
while true; do
  # Power/Battery Status
  if [[ $(acpi -b) == *"Discharging"* ]]; then
    DWM_BATTERY=$(acpi -b | grep -Eo "[0-9]+%");
  else
    DWM_BATTERY="AC";
  fi

  # Date
  DWM_DATE=$( date +"%d %a" )

  # Clock
  DWM_CLOCK=$( date +"%H:%M" )

  # Separator
  DWM_SEP=" $( echo '•' ) "

  # Widgets array
  DWM_WIDGETS=("$DWM_BATTERY" "$DWM_DATE" "$DWM_CLOCK")

  # Final bar
  DWM_BAR="$( printf "${DWM_SEP}%s" "${DWM_WIDGETS[@]}" )"
  DWM_BAR="${DWM_BAR:${#DWM_SEP}}"
  xsetroot -name "${DWM_BAR}"

  # Update time every minute
  sleep 1m
done &

# Load bitmap fonts
mkfontdir ~/.fonts
mkfontscale ~/.fonts
xset fp+ ~/.fonts

# Load X ressources (Xdefault is deprecated)
xrdb ~/.Xresources

# Laptop keyboard layout
#setxkbmap -device `xinput -list | grep -i key | grep -m 1 "KEYBOARD_NAME" | grep -oP "(?<=id=)\d*"` fr

exec dwm
#exec awesome
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
