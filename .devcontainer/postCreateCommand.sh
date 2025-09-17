#!/bin/bash
set -e

# Github SSH Config

chmod 600 ~/.ssh/id_ed25519
ssh-keyscan github.com >> ~/.ssh/known_hosts
cat <<EOF >> ~/.ssh/config
Host github.com
    IdentityFile ~/.ssh/id_ed25519
    User git
EOF

chmod 600 ~/.ssh/config

# Github main repo disable git

rm -rf /workspaces/vscode/.git 
