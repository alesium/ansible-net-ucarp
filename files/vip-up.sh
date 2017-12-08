#!/bin/bash
dir=$(dirname $0)
. $dir/vip-functions

INTERFACE="$1":"$3"
IP=$2

sleep 3
if [ $(get_interface_status $INTERFACE) == 255 ]; then
        plumb_interface $INTERFACE
        assign_interface_ip $INTERFACE $IP
fi
up_interface $INTERFACE 
    
    
