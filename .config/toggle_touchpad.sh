#!/bin/bash

ID=16

STATE=$(xinput list-props $ID | grep "Device Enabled" | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
    xinput disable $ID
    notify-send "Touchpad disabled"
else
    xinput enable $ID
    notify-send "Touchpad enabled"
fi
