#!/bin/bash

if [ -f blacklist.txt ]; then
    while IFS= read -r ip; do
        echo "Adding $ip to blacklist";
        sudo iptables -A INPUT -s "$ip" -j DROP
    done < blacklist.txt
fi

echo "Firewall rules applied."