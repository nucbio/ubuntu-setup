#!/bin/bash

# Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Gemini
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node
npm install -g @google/gemini-cli
