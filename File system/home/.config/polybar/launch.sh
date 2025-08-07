#!/usr/bin/env bash

# Kill all existing polybar instances
killall -q polybar

# Wait for polybar to fully shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Log separator
echo "---" | tee -a /tmp/polybar-nya.log

# Get the names of all connected monitors
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Loop through each monitor and launch Polybar
for m in $MONITORS; do
  # Set the MONITOR environment variable for each Polybar instance
  echo "Launching on monitor: $m" | tee -a /tmp/polybar-nya.log
  MONITOR=$m polybar Nya! 2>&1 | tee -a /tmp/polybar-nya.log &
done

# Wait for a moment to allow Polybar instances to start before checking their status.
sleep 2
if [ "$(pgrep -x polybar)" ]; then
  echo "[✓] Polybar launched successfully."
else
  echo "[!] Polybar failed to launch. Check the log file for details." | tee -a /tmp/polybar-nya.log
fi
