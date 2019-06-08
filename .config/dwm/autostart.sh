#!/usr/bin/env bash
#    _____ _     ____  ____  ____  ____  _____
#   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
#   |  __\| |   | / \||  \/|| / \||  \/|  / \
#   | |   | |_/\| |-|||  __/| \_/||    /  | |
#   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/


enable_hotkeys() {
    sxhkd -c ~/.config/sxhkd/sxhkdrcdwm
}
enable_hotkeys &


update_status() {
    ~/.config/dwm/status.sh
}
while true; do
    update_status
    sleep 10s
done &


update_weather(){
    curl -s wttr.in > ~/.weatherreport
    printf "%s" "$(sed '16q;d' ~/.weatherreport | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/☔ /g" | tr -d '\n')"
    sed '13q;d' ~/.weatherreport | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ❄️",$1 "°","🌞",$2 "°"}' > ~/.weatherreportshort
}
while true; do
    update_weather
    sleep 3600s
done &
