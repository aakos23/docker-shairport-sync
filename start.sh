#!/bin/sh

file="/var/run/dbus/pid"

if [ -f $file ]; then rm $file; fi
mkdir -p /var/run/dbus
dbus-daemon --system && avahi-daemon -D && shairport-sync -m avahi -a "$AIRPLAY_NAME" "$@"
