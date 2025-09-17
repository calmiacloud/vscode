FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update \
 && apt-get install -y curl gnupg software-properties-common python3 python3-pip

# Node.js (LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs

# Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
 && apt-get update && apt-get install -y terraform

# Ansible
RUN add-apt-repository --yes --update ppa:ansible/ansible \
 && apt-get install -y ansible

 # Git

RUN git config --global commit.template /workspaces/vscode/.devcontainer/.gitmessage.txt

# Worskspace folder
RUN mkdir -p /workspaces/vscode/code
WORKDIR /workspaces/vscode/code