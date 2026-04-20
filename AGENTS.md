# AGENTS.md

Personalized Ubuntu 24.04 LTS GNOME setup (inspired by Omakub).

## Install

```bash
wget -qO- https://github.com/nucbio/ubuntu-setup/raw/main/boot.sh | bash
```

Or for development:
```bash
git clone git@github.com:nucbio/ubuntu-setup.git
# Set UBUNTU_SETUP_DIR to your cloned repo and run install.sh
UBUNTU_SETUP_DIR=$PWD ./install.sh
```

## Profiles

Three install profiles selected via `gum choose`: `Home`, `Work-WS`, `Bio-WS`.

## Key scripts

- `boot.sh` - Downloads repo and triggers install
- `install.sh` - Main orchestrator, disables lock/sleep during install
- `install/installers.sh` - Base packages (git, flatpak, dconf, etc.)
- `install/install_apps.sh` - App installations per profile
- `install/settings.sh` - GNOME gsettings configuration

## Important notes

- Runs on fresh Ubuntu 24.04 LTS GNOME Desktop only
- Disables screen lock and idle timeout during install (reverts at end)
- Clones to `$HOME/.local/share/ubuntu-setup` by default
- Uses `gum` (charm.sh) for CLI TUI prompts