#!/bin/bash


if ! command -v ansible >/dev/null 2>&1; then
	echo "Installing Ansible..."
	sudo zypper in -y ansible
fi

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation finished."
