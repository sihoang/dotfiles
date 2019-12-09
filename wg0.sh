#!/bin/bash

# This script adds wg0 interface and sets route manually
# without having to use wg-quick
# Make sure there is
# 1. /etc/wireguard/wg0.conf
# 2. Edit the wg network address and dns server accordingly

set -ex

[[ $UID != 0 ]] && exec sudo -E "$(readlink -f "$0")" "$@"

WG_LOCAL_IP=10.0.0.2/24
DNS_NS=1.1.1.1

up() {
    ip link add dev wg0 type wireguard
    ip address add dev wg0 $WG_LOCAL_IP
    wg setconf wg0 /etc/wireguard/wg0.conf
    wg set wg0 fwmark 1234
    ip link set wg0 up
    ip route add default dev wg0 table 2468
    ip rule add not fwmark 1234 table 2468
    ip rule add table main suppress_prefixlength 0
    echo "nameserver $DNS_NS" | resolvconf -a tun.wg0 -x
}

down() {
    resolvconf -d tun.wg0
    ip route del default dev wg0 table 2468
    ip rule del not fwmark 1234 table 2468
    ip rule del table main suppress_prefixlength 0
    ip link del wg0
}


command="$1"
shift

case "$command" in
    up) up "$@" ;;
    down) down "$@" ;;
    *) echo "Usage: $0 up|down" >&2; exit 1 ;;
esac
