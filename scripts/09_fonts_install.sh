#!/usr/bin/env bash

print_header "Fonts"
print_title "Installing Fonts"
execute "brew tap homebrew/cask-fonts" "tap cask-fonts"

fonts=(
    "font-code-new-roman-nerd-font"
    "font-fantasque-sans-mono-nerd-font"
    "font-fira-code-nerd-font"
    "font-fira-mono-nerd-font"
    #"font-fira-mono-for-powerline"
    "font-hack-nerd-font"
    "font-inconsolata-nerd-font"
    #"font-inconsolata-g-for-powerline"
    "font-inconsolata-lgc-nerd-font"
    "font-inconsolata-for-powerline"
    "font-inconsolata-go-nerd-font"
    "font-inconsolata-nerd-font"
    "font-meslo-lg-nerd-font"
    "font-meslo-for-powerline"
    "font-mononoki-nerd-font"
    #"font-source-code-pro-for-powerline"
    )

for font in "${fonts[@]}"
do
    execute "brew install --cask ${font}" "${font}"
done
