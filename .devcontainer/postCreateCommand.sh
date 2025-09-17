#!/usr/bin/env bash
set -euo pipefail

# Github SSH Config

mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [ -n "${SSH_KEY:-}" ]; then
  printf "%s" "$SSH_KEY" > ~/.ssh/id_ed25519
  chmod 600 ~/.ssh/id_ed25519
else
  echo "⚠️  SSH_KEY no está disponible. Revisa Codespaces > User secrets y su visibilidad."
fi
ssh-keyscan github.com >> ~/.ssh/known_hosts 2>/dev/null || true
chmod 644 ~/.ssh/known_hosts
if ! grep -q "^Host github.com$" ~/.ssh/config 2>/dev/null; then
  {
    echo "Host github.com"
    echo "  User git"
    echo "  IdentityFile ~/.ssh/id_ed25519"
  } >> ~/.ssh/config
fi
chmod 600 ~/.ssh/config

# Githhub defailt message

git config --global commit.template /workspaces/vscode/.devcontainer/.gitmessage.txt

# Github main repo disable git

rm -rf /workspaces/vscode/.git 
