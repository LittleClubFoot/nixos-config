# NixOS Configuration

This repository contains a NixOS system configuration managed through Nix flakes, providing a declarative and reproducible setup.

## Overview

The configuration is structured as a flake-based NixOS setup, utilizing `nixpkgs` unstable channel and integrating `home-manager` for user environment management. It defines NixOS configurations organized into modular components for hardware, home, packages, and services.

Key characteristics:
- Flake-based configuration for reproducible builds
- Modular organization into hardware, home, packages, and services
- Integration with home-manager for user-specific configurations
- Support for users with customizable environments including zsh shell and administrative privileges

## Project Structure

```
.
├── flake.nix          # Main flake definition
├── flake.lock         # Flake lock file for dependency pinning
├── hosts/             # Host-specific configurations
│   └── <hostname>.nix  # Host-specific configurations
├── modules/           # Modular NixOS configuration components
│   ├── hardware/      # Hardware-specific configurations
│   │   ├── common.nix     # Common hardware settings
│   │   └── <hostname>.nix  # Hardware config for <hostname>
│   ├── home/          # Home-manager configurations
│   │   └── <username>.nix # User configuration for <username>
│   ├── packages/      # Package definitions
│   │   ├── all-packages.nix # Aggregated package list
│   │   ├── base.nix         # Base system packages
│   │   ├── dev.nix          # Development tools
│   │   ├── <hostname>.nix    # Host-specific packages
│   │   ├── media.nix        # Media-related packages
│   │   └── terminals.nix    # Terminal applications
│   ├── services/      # System service configurations
│   │   ├── base.nix         # Base services
│   │   ├── home-server.nix  # Home server services
│   │   ├── hyperland.nix    # Hyprland display manager
│   │   └── nas.nix          # NAS integration services
│   └── shell.nix       # Shell environment configuration
├── .gitignore         # Git ignore rules
├── LICENSE            # License information
└── README.md          # This file
```

## Key Files

- [`flake.nix`](flake.nix): Defines the flake inputs (nixpkgs, home-manager) and outputs NixOS configurations for various hosts. Includes special arguments as needed.
- [`flake.lock`](flake.lock): Locks the versions of flake inputs for reproducible builds.
- [`hosts/<hostname>.nix`](hosts/<hostname>.nix): Host-specific configuration importing hardware modules and defining user settings, time zone, and home-manager integration.

## Installation

To use this configuration:

1. Ensure Nix is installed with flake support enabled.
2. Clone this repository to a local directory.
3. Build and switch to the configuration:

   ```bash
   sudo nixos-rebuild switch --flake .#<hostname>
   ```

## Onboarding a New Host

This section provides detailed instructions for integrating a new host into this NixOS configuration repository, starting from a fresh NixOS installation.

### Prerequisites

- Fresh NixOS installation (e.g., from minimal or graphical ISO).
- Access to the installation environment with administrative privileges.

### Steps

1. **Enable Flake Support**

   If flakes are not enabled by default, edit `/etc/nixos/configuration.nix` and add:

   ```nix
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   ```

   Then apply the changes:

   ```bash
   sudo nixos-rebuild switch
   ```

2. **Establish Internet Connection**

   - **Wired Connection**: NixOS typically auto-configures DHCP. Verify connectivity with `ping -c 1 google.com`.
   - **Wireless Connection**: Use `iwctl` for WPA supplicant-based connections.
     - List wireless devices: `iwctl device list`
     - Scan for networks: `iwctl station <device> scan`
     - Display available networks: `iwctl station <device> get-networks`
     - Connect to a network: `iwctl station <device> connect <SSID>`
     - Provide the network password if prompted.

3. **Access Git Temporarily**

   Use nix-shell to temporarily make Git available without permanent installation:

   ```bash
   nix-shell -p git
   ```

   This command opens a new shell environment with Git in the PATH. Execute the following commands within this nix-shell session.

4. **Clone the Repository**

   Clone the configuration repository into the standard location:

   ```bash
   cd ~/.config
   git clone https://github.com/LittleClubFoot/nixos-config nixos-config
   cd nixos-config
   ```

5. **Generate Hardware Configuration**

   Generate the hardware-specific configuration for the new host:

   ```bash
   sudo nixos-generate-config --show-hardware-config > hosts/<hostname>.nix
   ```

   Replace `<hostname>` with a unique identifier for the new host (e.g., `newhost`).

6. **Update the Flake Configuration**

   - Edit `flake.nix` to add a new entry in the `nixosConfigurations` attribute set for the new host.
   - Import the generated hardware configuration file (`hosts/<hostname>.nix`) and relevant modules from the `modules/` directory (e.g., `hardware.common`, `packages.base`, `services.base`).
   - Customize the configuration as needed, referencing the existing `kamrui-e1` configuration for structure.

7. **Build and Switch to the New Configuration**

   Apply the configuration to the system:

   ```bash
   sudo nixos-rebuild switch --flake .#<hostname>
   ```

   This command builds the system closure and switches to it. Monitor for errors and resolve any module conflicts.

8. **Post-Installation Verification**

   - Verify system services: Check that defined services (e.g., from `modules/services/`) are running.
   - Confirm home-manager setup: Ensure user environments are configured correctly.
   - Update dependencies: Run `nix flake update` to refresh the lock file if adding new inputs.

## Usage

- **Building**: `sudo nixos-rebuild build --flake .#<hostname>`
- **Switching**: `sudo nixos-rebuild switch --flake .#<hostname>`
- **Testing**: `sudo nixos-rebuild test --flake .#<hostname>`

The configuration includes home-manager, which will automatically configure user environments upon system rebuild.

## Modules

### Hardware
- `common.nix`: Shared hardware configurations
- `<hostname>.nix`: Specific hardware settings for each host

### Home
- `<username>.nix`: Home-manager configuration for user <username>

### Packages
- `all-packages.nix`: Aggregates all package definitions
- `base.nix`: Essential system packages
- `dev.nix`: Development and programming tools
- `<hostname>.nix`: Host-specific additional packages
- `media.nix`: Multimedia applications
- `terminals.nix`: Terminal emulators and related tools

### Services
- `base.nix`: Fundamental system services
- `home-server.nix`: Services for home server functionality
- `hyperland.nix`: Hyprland window manager and display services
- `nas.nix`: Network Attached Storage integration services

## Contributing

Contributions are welcome. Please ensure changes maintain the modular structure and are tested before submission.

## License

This project is licensed under the terms specified in the [`LICENSE`](LICENSE) file.