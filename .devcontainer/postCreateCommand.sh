rm -rf /workspaces/vscode/.git 
chmod 600 ~/.ssh/id_ed25519 && ssh-keyscan github.com >> ~/.ssh/known_hosts
echo 'Host github.com\n  IdentityFile ~/.ssh/id_ed25519\n  User git' >> ~/.ssh/config && chmod 600 ~/.ssh/config
