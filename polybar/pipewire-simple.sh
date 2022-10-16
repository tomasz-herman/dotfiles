#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

if ! [[ $VOLUME =~ ^[0-9]+$ ]]; 
   then VOLUME="--"
fi

case $1 in
    "--up")
        pamixer --increase 10
        ;;
    "--down")
        pamixer --decrease 10
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
#        echo "Source: ${SOURCE} | Sink: ${VOLUME} ${SINK}"
    if [ $MUTED = "muted" ]; then
    echo "🔇 ${VOLUME}%"
    elif [ $(($VOLUME)) -eq 0 ]; then
    echo "🔇 ${VOLUME}%"
    elif [ $(($VOLUME)) -le 30 ]; then
    echo "🔈 ${VOLUME}%"
    elif [ $(($VOLUME)) -le 60 ]; then
    echo "🔉 ${VOLUME}%"
    else
    echo "🔊 ${VOLUME}%"
    fi
esac
