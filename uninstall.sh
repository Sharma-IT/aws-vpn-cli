#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print with color
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
    print_status "$YELLOW" "Please run as root or with sudo"
    exit 1
fi

# Remove symlink from /usr/local/bin
if [ -L "/usr/local/bin/aws-vpn" ]; then
    print_status "$YELLOW" "Removing aws-vpn command..."
    rm /usr/local/bin/aws-vpn
    print_status "$GREEN" "✓ Uninstalled aws-vpn command"
else
    print_status "$RED" "✗ aws-vpn command not found in /usr/local/bin"
fi
