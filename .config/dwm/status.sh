#!/usr/bin/env bash
#    _____ _     ____  ____  ____  ____  _____
#   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
#   |  __\| |   | / \||  \/|| / \||  \/|  / \
#   | |   | |_/\| |-|||  __/| \_/||    /  | |
#   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/


# Custom Status Blocks
#--------------------------------------------------------------------------------

# date ------
dte(){
    date +'%Y-%m-%d'
}
dte1(){
    notify-send "Date: $(date)"
}
# -----------

# time ------
tme(){
    date +'🕒 %H:%M'
}
tme1(){
    notify-send "Date: $(date)"
}
# -----------

# memory ----
mem(){
    mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
    echo -e "💾 $mem"
}
# -----------

# battery ---
bat(){
    string=$(acpi -b 2> /dev/null)
    if [[ $string == *"Battery"* ]]; then
        if [[ $string == *"Discharging"* ]]; then
            icon=🔋
        else
            icon=🔌
        fi
        if [[ $string == *"100%"* ]]; then
            if [[ $icon == 🔋 ]]; then
                echo -e "🔋 Full"
            else
                echo -e 🔌
            fi
            return
        fi
        percentage=$(echo $string | cut -d "," -f2 | cut -d "," -f1)
        echo -e $icon$percentage
        return
    fi
    # on desktop, its not necessary to display battery info:
    echo -e ""
}
bat1(){
    notify-send "$(acpi -b)"
}
# -----------

# volume ----
vol(){
    sc=$($HOME/.scripts/soundcard)
    string=$(amixer -c $sc get Master)
    if [[ $string == *"[on]"* ]]; then
        percentage=$(echo $string | cut -d "[" -f2 | cut -d "]" -f1)
        echo -e "🔊 $percentage"
    else
      echo -e 🔇
    fi
}
vol1(){
    sc=$($HOME/.scripts/soundcard)
    string=$(amixer -c $sc get Master)
    notify-send "Volume" "$string"
}
# -----------

# weather ---
wtr(){
    s=$(cat ~/.cache/weatherreportshort)
    if [ -n "$s" ]; then
        echo -e "$s"
    else
        echo -e ""
    fi
}
wtr1(){
    s=$(cat ~/.cache/weatherreport)
    report=$(cat ~/.cache/weatherreport | sed 7q)
    notify-send Weather "$report"
}
# -----------

# jupyter ---
hub(){
    if [ -f /etc/systemd/system/jupyterhub.service ]; then
        if [[ $(systemctl is-active jupyterhub) == "active" ]]; then
            echo -e 🪐
            return;
        fi
    fi
    echo -e ""
}
hub1(){
    name=jupyterhub
    notify-send "$(systemctl status $name | sed 1q)" "$(systemctl status $name | grep Active)"
}
# -----------

# sshtunnel -
ssh(){
    if [ -f /etc/systemd/system/sshtunnel.service ]; then
        if [[ $(systemctl is-active sshtunnel) == "active" ]]; then
            echo -e 🔗;
            return;
        fi
    fi
    echo -e ""
}
ssh1(){
    name=sshtunnel
    notify-send "$(systemctl status $name | sed 1q)" "$(systemctl status $name | grep Active)"
}

# -----------

# openvpn ---
vpn(){
    if [ -f /etc/systemd/system/openvpn.service ]; then
        if [[ $(systemctl is-active openvpn) == "active" ]]; then
            echo -e 🔒;
            return;
        fi
    fi
    echo -e ""
}
vpn1(){
    name=openvpn
    notify-send "$(systemctl status $name | sed 1q)" "$(systemctl status $name | grep Active)"
}
# -----------

# sshd ------
sshd(){
    if [ -f /usr/lib/systemd/system/sshd.service ]; then
        if [[ $(systemctl is-active sshd) == "active" ]]; then
            echo -e ⛓️;
            return;
        fi
    fi
    echo -e ""
}
sshd1(){
    name=sshd
    notify-send "$(systemctl status $name | sed 1q)" "$(systemctl status $name | grep Active)"
}
# -----------

# cpu -------
cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}
cpu1(){
    notify-send "cpu"
}
# cpu -------

# bluetooth -
bt(){
    device=$(echo exit | bluetoothctl | grep -o -m 1 "\b\[.*\]")
    if [ $device = "[bluetooth]" ]; then
        echo -e ""
    else
        echo -e 🦷
    fi
}
bt1(){
    notify-send "bluetooth"
}
# -----------

#--------------------------------------------------------------------------------

# Which block was clicked
#--------------------------------------------------------------------------------

BLOCK=""
if [[ $1 ]]; then
    BLOCK=$1
fi

#--------------------------------------------------------------------------------


# Which button was clicked
#--------------------------------------------------------------------------------

BUTTON=""
if [[ $2 == 1 ]]; then
    BUTTON=1
fi
if [[ $2 == 2 ]]; then
    BUTTON=2
fi
if [[ $2 == 3 ]]; then
    BUTTON=3
fi

#--------------------------------------------------------------------------------



# Status Command
#--------------------------------------------------------------------------------

status(){
    s=""
    delim="|"
    i=0
    for func in $@
    do
        out=$($func)
        if [ "$out" ]; then
            s=$s" "$out" "$delim
            if [[ $BLOCK == $i && $BUTTON ]]; then
                $($func$BUTTON)
            fi
            i=$((i+1))
        fi
    done
    xsetroot -name "$s"
}

#--------------------------------------------------------------------------------


# Activate Status Blocks with Status Command
#--------------------------------------------------------------------------------

status vpn hub ssh sshd bt vol bat wtr dte tme

#--------------------------------------------------------------------------------

