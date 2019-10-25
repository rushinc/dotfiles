#!/bin/bash

# Terminate running instance
pkill dunst

# Wait for process to shut down
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

# Launch dunst ith hostname specific config
case $HOSTNAME in
	archPad)
		dunst -config $HOME/.config/dunst/dunstrc_hidpi &
		;;
	*)
		dunst -config $HOME/.config/dunst/dunstrc_default &
		;;
esac

if [ "$1" == "--test" ] || [ "$1" == "-t" ]; then
	notify-send -u critical "Test message: critical test 1"
	notify-send -u normal "Test message: normal test 2"
	notify-send -u low "Test message: low test 3"
	notify-send -u critical "Test message: critical test 4"
	notify-send -u normal "Test message: normal test 5"
	notify-send -u low "Test message: low test 6"
	notify-send -u critical "Test message: critical test 7"
	notify-send -u normal "Test message: normal test 8"
	notify-send -u low "Test message: low test 9"
fi

exit 0
