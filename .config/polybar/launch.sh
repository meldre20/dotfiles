#!/usr/bin/env bash

# Fallback for display and authority if not set
export DISPLAY="${DISPLAY:-:0}"
if [ -z "$XAUTHORITY" ] && [ -f "/run/user/$UID/gdm/Xauthority" ]; then
    export XAUTHORITY="/run/user/$UID/gdm/Xauthority"
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Launch main bar
echo "---" | tee -a /tmp/polybar1.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Polybar launched..."
