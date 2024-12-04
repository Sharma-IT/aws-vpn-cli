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

# Define paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_FILE="$SCRIPT_DIR/aws-vpn-cli"
DEST_FILE="/usr/local/bin/aws-vpn"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    print_status "$RED" "Error: Source file $SOURCE_FILE not found"
    exit 1
fi

# Check if AWS VPN Client is installed
if [ ! -d "/Applications/AWS VPN Client/AWS VPN Client.app" ]; then
    print_status "$RED" "Error: AWS VPN Client not found in /Applications"
    print_status "$YELLOW" "Please install AWS VPN Client first"
    exit 1
fi

# Check Python version
if ! command -v python3 &> /dev/null; then
    print_status "$RED" "Error: Python 3 is required but not installed"
    exit 1
fi

# Create backup if file exists
if [ -f "$DEST_FILE" ]; then
    print_status "$YELLOW" "Backing up existing aws-vpn..."
    mv "$DEST_FILE" "${DEST_FILE}.backup"
fi

# Copy and rename file
print_status "$GREEN" "Installing aws-vpn..."
cp "$SOURCE_FILE" "$DEST_FILE"

# Set permissions
chmod 755 "$DEST_FILE"

# Verify installation
if [ -f "$DEST_FILE" ] && [ -x "$DEST_FILE" ]; then
    print_status "$GREEN" "✓ Installation successful!"
    print_status "$GREEN" "You can now use the 'aws-vpn' command from anywhere"
    print_status "$YELLOW" "Example usage:"
    echo "  aws-vpn connect         # Connect using most recent profile"
    echo "  aws-vpn -c              # Same as above (short form)"
    echo "  aws-vpn status          # Check VPN status"
    echo "  aws-vpn -s              # Same as above (short form)"
    echo "  aws-vpn help            # Show help information"
    echo "  aws-vpn -h              # Same as above (short form)"
else
    print_status "$RED" "✗ Installation failed"
    exit 1
fi
