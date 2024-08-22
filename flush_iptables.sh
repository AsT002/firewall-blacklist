#!/bin/bash

# Flush all existing rules in the filter table
echo "Flushing all iptables rules in the filter table..."

# Flush all rules in the filter table
sudo iptables -F

# Delete all user-defined chains in the filter table
sudo iptables -X

# Set default policies to ACCEPT
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

echo "All iptables rules in the filter table have been flushed and default policies have been set."