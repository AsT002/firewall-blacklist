# firewall-blacklist

# Overview
The firewall-blacklist project provides a set of scripts to manage IP address blacklisting using iptables on Linux systems. The project includes tools for adding IPs to a blacklist, applying the blacklist to iptables, and flushing iptables rules. 

# Scripts
# 1. add_to_blacklist.sh
Adds an IP address to the blacklist.txt file.
Usage:
```bash
./add_to_blacklist.sh <IP_ADDRESS>
```

# 2. apply_blacklist.sh
Applies the blacklist from blacklist.txt to iptables, blocking all IP addresses listed in the file.
Usage:
```bash
./apply_blacklist.sh
```

# 3. flush_iptables.sh
Flushes all iptables rules and applies a default configuration.
Usage:
```bash
./flush_iptables.sh
```

# Prerequisites
* Linux operating system with iptables installed
* Bash shell (compatible with standard bash syntax)
* blacklist.txt file in the same directory as the scripts

# Setup
Clone the Repository:
```basht
git clone https://github.com/AsT002/firewall-blacklist.git
cd firewall-blacklist
```

#Make the Scripts Executable:
```bash
chmod +x add_to_blacklist.sh apply_blacklist.sh flush_iptables.sh
```

# Usage
 - Adding an IP Address to the Blacklist
```bash
./add_to_blacklist.sh <IP_ADDRESS>
```
 - Applying the Blacklist to iptables
```bash
./apply_blacklist.sh
```
 - Flushing and Applying Default iptables Rules
```bash
./flush_iptables.sh
```

# Example of Usage
<img src="https://github.com/AsT002/firewall-blacklist/blob/main/Screenshot%202024-08-22%20at%201.50.36%20PM.png">

# Notes
* Permissions: Ensure you run the scripts with sufficient permissions (typically with sudo or as the root user) to modify iptables rules.
