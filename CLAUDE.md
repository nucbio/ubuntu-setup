# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personalized Ubuntu 24.04 LTS GNOME setup automation (inspired by [Omakub](https://omakub.org/)). Targets fresh Ubuntu GNOME desktop installs across three profiles: **Home**, **Work-WS**, **Bio-WS**.

## Running / developing

```bash
# Fresh install (downloads and runs)
wget -qO- https://github.com/nucbio/ubuntu-setup/raw/main/boot.sh | bash

# Development: run against local clone
UBUNTU_SETUP_DIR=$PWD ./install.sh
```

There are no tests, no lint tools, and no build step. Scripts are plain bash — validate with `bash -n <script>` for syntax checking.

## Architecture

### Execution flow

`boot.sh` → `install.sh` → sources in order:
1. `install/00_versions.sh` — version pins for all software
2. `install/set_choice.sh` — profile selection via `gum choose` (sets `$INSTALL_OPT`)
3. `install/installers.sh` — base apt packages
4. `install/install_apps.sh` — loops and sources every `apps_install/*.sh`
5. `install/settings.sh` — loops and sources every `settings/*.sh`
6. `langs/r.sh` + `langs/python.sh` — language environments

### Profile branching

Scripts branch on `$INSTALL_OPT` throughout:
```bash
[[ "$INSTALL_OPT" == "Home" ]]     # home-only
[[ "$INSTALL_OPT" != "Bio-WS" ]]   # excludes bio workstation
[[ "$INSTALL_OPT" == "Bio-WS" ]]   # bio workstation only
```

### Key conventions

- **Version pins** all live in `install/00_versions.sh` — always update versions there, not inline.
- **Path**: `$UBUNTU_SETUP_DIR` is the repo root at runtime; `$HOME/.local/bin` for user binaries; `$HOME/tools/` for source-built tools (R).
- **Bash config** is modular: `configs/bashrc.d/common/` (all profiles), `local/`, `home/`, `ws/` (profile-specific). `settings/bash.sh` copies the right subdirectories.
- **GNOME config** is in `settings/gnome_gsettings.sh` (UI/theme/fonts), `settings/hotkeys.sh` (keybindings), `settings/gnome_plugins.sh` (extensions).
- **`apps_install/required/`** — scripts here run for all profiles before the main loop (currently just `app_gum.sh` which installs `gum` needed for TUI prompts).
