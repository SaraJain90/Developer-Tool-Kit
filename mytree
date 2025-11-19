#!/bin/bash

DIR="$(pwd)"

BLUE="\e[34m"
CYAN="\e[36m"
YELLOW="\e[33m"
GREEN="\e[32m"
BOLD="\e[1m"
RESET="\e[0m"

echo -e "${BOLD}${GREEN}📁 $(basename "$DIR")${RESET}"

print_tree() {
    local path="$1"
    local prefix="$2"

    local entries=("$path"/*)
    local total=${#entries[@]}
    local index=0

    for entry in "${entries[@]}"; do
        ((index++))

        if [[ $index -eq $total ]]; then
            branch="└──"
            new_prefix="$prefix    "
        else
            branch="├──"
            new_prefix="$prefix│   "
        fi

        if [[ -d "$entry" ]]; then
            echo -e "${prefix}${branch} ${BLUE}📁 ${BOLD}$(basename "$entry")${RESET}"
            print_tree "$entry" "$new_prefix"
        elif [[ -f "$entry" ]]; then
            echo -e "${prefix}${branch} ${CYAN}📄 $(basename "$entry")${RESET}"
        fi
    done
}

print_tree "$DIR" ""
