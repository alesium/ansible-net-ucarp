#!/bin/bash
IPADM="/usr/sbin/ipadm"
DESIRED_STATE="down"
INTERFACE=""
ifconfig $1:$3  > /dev/null 2>&1
if [ $? == 1 ]; then
        ifconfig "$1":"$3" plumb
        ifconfig "$1":"$3" $2 netmask 255.255.255.0
        exit 0
fi
for line in `ifconfig $1:$3 | awk '{ if ($0 ~ /\=/ ) { print $2 } else { FS=" "; print $2 } }'`
do
        echo $line
    if [ -z $INTERFACE ]; then
            #interface exist
            INTERFACE="$1:$3"
            echo $line | grep UP  > /dev/null 2>&1
            if [ $? == 0 ]; then
                # interface is up
                STATE="up"
                continue
            else
                STATE="down"
            fi
    else
        if [ $2 == $line ]; then
            # ip are the same
            if [ $DESIRED_STATE != $STATE ]; then
                ifconfig "$1":"$3" down
            fi
        else
            echo "Error: $1:$3 IP is wrong"
            exit 255
        fi
    fi
done

