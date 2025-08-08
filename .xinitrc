#!/bin/sh

# --- Run system xinitrc.d scripts ---
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*.sh; do
        [ -x "$f" ] && . "$f"
    done
fi

# --- Fcitx5 ---
# Fcitx5 input method environment variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
#export INPUT_METHOD=fcitx

# Optional: uncomment if needed for specific applications
#export SDL_IM_MODULE=fcitx
#export _JAVA_AWT_WM_NONREPARENTING=1

# Start Fcitx5 in the background if not already running
if ! pgrep -x fcitx5 > /dev/null; then
    fcitx5 &> /dev/null &
fi

# --- Start settings daemon for X11 ---
xsettingsd &
# --- Start window manager: must be the last command; exec replaces the shell ---
exec bspwm
