#!/bin/sh

# exit on error and unset vars
set -eu

GITHUB_USERNAME=gmpmagalhaes

output() {
	color_code="$1"
	shift

	printf "\033[${color_code}m==> %s\033[0m\n" "$*" >&2
}

info() {
	output "1;36" "$@"
}

error() {
	output "1;31" "$@"
}

info "Running dotfiles installation script..."

sudo apt update

if ! command -v git >/dev/null 2>&1; then
	info "Installing git..."
	sudo apt install -y --no-install-recommends git
fi

if ! chezmoi="$(command -v chezmoi)"; then
	info "Installing chezmoi"
	sh -c "$(wget -qO- https://get.chezmoi.io/)" --init --apply $GITHUB_USERNAME
fi
