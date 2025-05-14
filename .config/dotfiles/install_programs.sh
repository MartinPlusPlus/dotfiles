#!/bin/bash

NAME=$(grep '^NAME=' /etc/os-release | sed 's/NAME=//' | tr -d '"')

success () {
	echo -e "\e[32mSUCCESS\e[0m: $1"
}

failure () {
	echo -e "\e[31mFAILURE\e[0m: $1"
}

declare -A packages
pacman=""

if [ "$NAME" == "Ubuntu" ] || [ "$NAME" == "Debian" ]; then
	if ! which apt >/dev/null 2>&1; then
		failure "apt-get is not available on this computer."
		exit 1
	else
		success "This computer has apt-get"
		pacman="sudo apt install -y "
		sudo apt update -y
	fi
elif [ "$NAME" == "Arch Linux" ]; then
	if ! which pacman >/dev/null 2>&1; then
		failure "pacman is not available on this system."
		exit 1
	else
		pacman="pacman -S --noconfirm "

		if ! which yay >/dev/null 2>&1; then
			failure "yay is not installed, installing..."
			# TODO: Install yay
		else
			yay -Sy --noconfirm
			pacman="yay -S --noconfirm "
		fi
	fi
fi

while IFS= read -r package; do
	echo "read $package"
	eval "$pacman $package"
	packages["$package"]="$?"
done < prereqs.txt

for key in "${!packages[@]}"; do
	echo "$key: ${packages[$key]}"
done
