#!/bin/bash

INTERFACE="wlp2s0"

STATUS_GENERAL=$(nmcli -t -f WIFI g)

IS_CONNECTED=$(nmcli -t -f DEVICE,STATE device status | grep "^$INTERFACE" | cut -d':' -f2)

if [[ "$STATUS_GENERAL" == "enabled" && -n "$IS_CONNECTED" ]]; then
    echo ""
else
    echo ""
fi
