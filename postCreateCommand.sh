#!/bin/sh

# APT

sudo apt update -y 
sudo apt install gnupg software-properties-common -y

# Git config

git config --global commit.template .devcontainer/commit.template

# Terraform

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Ansible

sudo add-apt-repository --yes --update ppa:ansible/ansible

# Packages

sudo apt-get update -y
sudo apt install terraform ansible ansible-lint -y
