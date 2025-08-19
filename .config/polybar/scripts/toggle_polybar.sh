#!/bin/bash

pgrep -x polybar >/dev/null && { pkill -x polybar; bspc config top_padding 0; } || { polybar Nya! & bspc config top_padding 45; }
