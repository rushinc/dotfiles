#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar with hostname specific config
case $HOSTNAME in
	archPad)
		polybar -c /home/rushin/.config/polybar/config_hidpi top &
		;;
	*)
		polybar -c /home/rushin/.config/polybar/config_default top &
		;;
esac

exit 0
