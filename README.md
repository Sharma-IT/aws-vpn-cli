# AWS VPN CLI

A command-line interface tool for controlling the AWS VPN Client on macOS. This tool allows you to connect, disconnect, and manage your AWS VPN connections directly from the terminal.

<img width="1136" alt="image" src="https://github.com/user-attachments/assets/a8937a34-79e1-41ea-944e-946062665040">

## Features

- 🔌 Connect to VPN using most recent or specified profile
- 🔍 Auto-detection of most recently used profile
- 📊 Real-time connection status
- 📋 List available VPN profiles
- ⏱️ Connection timeout handling
- 🔄 Automatic state detection
- 🐛 Debug mode for troubleshooting
- 📟 Simple and intuitive command-line interface

## Requirements

- macOS
- Python 3.6+
- AWS VPN Client installed at `/Applications/AWS VPN Client/AWS VPN Client.app`
- At least one VPN profile configured in AWS VPN Client

## Installation

### Option 1: Automatic Installation (Recommended)

1. Clone this repository:
   ```bash
   git clone https://github.com/Sharma-IT/aws-vpn-cli.git
   cd aws-vpn-cli
   ```

2. Run the install script:
   ```bash
   ./install.sh
   ```

### Option 2: Manual Installation

1. Clone this repository:
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

```bash
# Connect using most recent profile
aws-vpn connect
aws-vpn -c

# Connect with specific profile
aws-vpn -c -p "Dev VPN"

# Disconnect from VPN
aws-vpn -d

# Check VPN status
aws-vpn -s

# List available profiles
aws-vpn -lp

# Show help
aws-vpn -h

# Enable debug mode
aws-vpn -c --debug              # Connect with debugging
aws-vpn -lp --debug            # List profiles with debugging
```

## Debugging

If you encounter issues, run commands with the `--debug` flag to get detailed information:

```bash
aws-vpn -c --debug
```

This will show:

- System information
- AWS VPN Client version
- AWS VPN Client installation status
- Profile detection details
- AppleScript execution logs
- Error messages and stack traces

Common issues:

1. AWS VPN Client not installed or not in the expected location
2. Outdated AWS VPN Client version
3. Missing or incorrect VPN profiles
4. Permission issues with AppleScript execution
5. Network connectivity problems

## Reporting Issues

If you encounter a problem:

1. First, ensure you're using the latest version of:
   - AWS VPN Client
   - aws-vpn-cli

2. Run the failing command with debug mode:
   ```bash
   aws-vpn -c --debug
   ```
 This will automatically create a debug log file at `~/.aws-vpn-cli/logs/debug.log`.

3. Create a new issue on GitHub with:
   - Description of what you were trying to do
   - What actually happened
   - Your OS version (`sw_vers` output)
   - AWS VPN Client version
   - The debug.log file content (⚠️ Make sure to remove any sensitive information)
   - Steps to reproduce the issue

Example issue template:
```markdown
**Description**
Trying to connect to VPN profile "Example VPN" but connection times out

**System Info**
- macOS: 13.1
- AWS VPN Client: 3.1.0
- aws-vpn-cli: latest

**Steps to Reproduce**
1. Run: aws-vpn -c -p "Example VPN"
2. Wait for timeout

**Debug Log**
<details>
<summary>Click to expand</summary>

[paste debug.log content here]

</details>
```
</details>

## Uninstallation

To uninstall the CLI tool:

```bash
./uninstall.sh
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

GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- AWS VPN Client team for providing the base VPN client
- macOS AppleScript for UI state detection
- Python community for excellent tooling support
