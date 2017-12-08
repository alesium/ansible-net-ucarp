#!/bin/bash
dir=$(dirname $0)
. $dir/vip-functions

INTERFACE="$1":"$3"
IP=$2

if [ $(get_interface_status $INTERFACE) == 255 ]; then
        plumb_interface $INTERFACE
        assign_interface_ip $INTERFACE $IP
elif [ $(get_interface_status $INTERFACE) == 254 ]; then
        down_interface $INTERFACE
        unplumb_interface $INTERFACE
        plumb_interface $INTERFACE
else
        down_interface $INTERFACE 
fi
