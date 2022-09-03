#!/usr/bin/env bash

print_header "Homebrew"

install_homebrew() {
    if [[ $(command -v brew) == "" ]]; then 
        execute \
            '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' \
            "Install Homebrew"

        # For Apple Silicon chips
        execute "echo 'eval \"$(/opt/homebrew/bin/brew shellenv)\"' >> \"/Users/$(whoami)/.zprofile\" && \
                eval \"$(/opt/homebrew/bin/brew shellenv)\"" \
                "Add homebrew to PATH"
	else
        execute "brew update" "Update Homebrew"
	fi
}

add_extra_brew_taps() {
    print_title "Add additional taps"
        
}

main() {
    print_title "Homebrew"
    install_homebrew
}

main
