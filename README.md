# AWS VPN CLI

A command-line interface tool for controlling the AWS VPN Client on macOS. This tool allows you to connect, disconnect, and manage your AWS VPN connections directly from the terminal.

<img width="1136" alt="image" src="https://github.com/user-attachments/assets/a644f0df-e528-4498-bcde-e14173d5c1fd">

## Features

- 🔌 Connect to VPN with profile selection
- 🔍 Auto-detection of most recently used profile
- 📊 Real-time connection status
- 📋 List available VPN profiles
- ⏱️ Connection timeout handling
- 🔄 Automatic state detection

## Prerequisites

- macOS operating system
- AWS VPN Client installed at: `/Applications/AWS VPN Client/AWS VPN Client.app`
- Python 3.6 or higher
- Configured VPN profiles in AWS VPN Client

## Installation

### Option 1: Automatic Installation (Recommended)

1. Clone the repository:
```bash
git clone https://github.com/Sharma-IT/aws-vpn-cli.git
cd aws-vpn-cli
```

2. Run the installation script:
```bash
sudo ./install.sh
```

This will install the `aws-vpn` command to `/usr/local/bin/` and make it available system-wide.

### Option 2: Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/Sharma-IT/aws-vpn-cli.git
cd aws-vpn-cli
```

2. Make the script executable:
```bash
chmod +x aws-vpn-cli
```

3. Create a symbolic link:
```bash
sudo ln -s "$(pwd)/aws-vpn-cli" /usr/local/bin/aws-vpn
```

## Usage

The CLI provides the following commands:

```bash
# Connect to VPN
aws-vpn connect [--profile PROFILE]  # Long form
aws-vpn -c [--p PROFILE]            # Short form

# Disconnect from VPN
aws-vpn disconnect  # Long form
aws-vpn -d         # Short form

# Check VPN status
aws-vpn status     # Long form
aws-vpn -s         # Short form

# List available profiles
aws-vpn list-profiles  # Long form
aws-vpn -lp           # Short form

# Show help
aws-vpn help  # Long form
aws-vpn -h    # Short form
```

### Examples

```bash
# Connect using most recent profile
aws-vpn connect
aws-vpn -c

# Connect with specific profile
aws-vpn connect --profile "Dev VPN"
aws-vpn -c --p "Dev VPN"

# Disconnect from VPN
aws-vpn disconnect
aws-vpn -d

# Check connection status
aws-vpn status
aws-vpn -s

# List all profiles
aws-vpn list-profiles
aws-vpn -lp

# Show help
aws-vpn -h
```

## How It Works

The tool uses AppleScript to interact with the AWS VPN Client GUI and system commands to verify the connection state. It employs multiple methods to detect the VPN connection status:

1. UI state detection via AppleScript
2. Network interface verification (utun)
3. Routing table analysis

This multi-layered approach ensures reliable connection status detection.

## Security

- No sensitive credentials are stored in the script
- Relies on existing AWS VPN Client authentication
- Requires user interaction for sensitive operations

## Limitations

- macOS only (due to AppleScript dependency)
- Requires AWS VPN Client to be installed
- Connection timeout is set to 60 seconds

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

GNU V.3.0 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

- AWS VPN Client team for providing the base VPN client
- macOS AppleScript for UI state detection
- Python community for excellent tooling support

## Support

If you encounter any issues or have questions, please:
1. Check the [Issues](https://github.com/Sharma-IT/aws-vpn-cli/issues) page
2. Create a new issue if your problem isn't already listed
3. Provide as much detail as possible, including:
   - macOS version
   - AWS VPN Client version
   - Error messages
   - Steps to reproduce
