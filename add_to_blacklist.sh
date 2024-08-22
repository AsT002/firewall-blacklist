#!/bin/bash

BLACKLIST_FILE="blacklist.txt"

# Create the blacklist file if it does not exist
test ! -f "$BLACKLIST_FILE" && touch "$BLACKLIST_FILE" && echo "blacklist.txt created"

# Function to validate IP address format
validate_ip() {
    local ip="$1"
    # Regex to validate IPv4 addresses
    if [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        IFS='.' read -ra octets <<< "$ip"
        if [ "${#octets[@]}" -eq 4 ] &&
           [ "${octets[0]}" -ge 0 ] && [ "${octets[0]}" -le 255 ] &&
           [ "${octets[1]}" -ge 0 ] && [ "${octets[1]}" -le 255 ] &&
           [ "${octets[2]}" -ge 0 ] && [ "${octets[2]}" -le 255 ] &&
           [ "${octets[3]}" -ge 0 ] && [ "${octets[3]}" -le 255 ]; then
            return 0
        fi
    fi
    return 1
}

# Prompt for IP address
if [[ $# -eq 0 ]]
then  
    read -p "Enter IP address to add to blacklist: " ip_address
else 
    ip_address="$1"
fi

# Validate and add IP
if validate_ip "$ip_address"; then
    if grep -q "^$ip_address$" "$BLACKLIST_FILE"; then
        echo "IP already in blacklist."
        exit 1
    else
        echo "$ip_address" >> "$BLACKLIST_FILE"
        echo "IP added to blacklist."
    fi
else
    echo "Invalid IP address format."
    exit 1
fi