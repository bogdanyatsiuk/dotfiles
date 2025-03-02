#!/bin/bash

# zsh
ln -s ~/dotfiles/user/.zshrc_main ~/.zshrc_main
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
touch ~/.zshrc
printf "# zshrc main\nsource ~/.zshrc_main\n\n# aliases\n[[ -f ~/aliases ]] && source ~/aliases" >> ~/.zshrc

# nvim
if [ ! -d ~/.config/nvim ]; then
mkdir ~/.config/nvim
fi
ln -s ~/dotfiles/user/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/user/.config/nvim/lua ~/.config/nvim/lua

# tmux
mkdir -p ~/.config/tmux
ln -s ~/dotfiles/user/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# yabai
#ln -s ~/dotfiles/user/.config/yabai/yabairc ~/.config/yabai/yabairc
#ln -s ~/dotfiles/user/.config/yabai/scripts ~/.config/yabai/scripts

# skhd
#ln -s ~/dotfiles/user/.config/skhd/skhdrc ~/.config/skhd/skhdrc

# sketchybar
if [ ! -d ~/.config/sketchybar ]; then
mkdir ~/.config/sketchybar
fi
ln -s ~/dotfiles/user/.config/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
ln -s ~/dotfiles/user/.config/sketchybar/plugins ~/.config/sketchybar/plugins

# aliases
ln -s ~/dotfiles/user/aliases ~/aliases

# karabiner
#ln -s ~/dotfiles/user/.config/karabiner.edn ~/.config/karabiner.edn

# alacritty
#ln -s ~/dotfiles/user/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# kitty
#ln -s ~/dotfiles/user/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
#ln -s ~/dotfiles/user/.config/kitty/startup_session ~/.config/kitty/startup_session

# WezTerm
mkdir -p ~/.config/wezterm
ln -s ~/dotfiles/user/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
mkdir -p ~/.config/wezterm/utils
ln -s ~/dotfiles/user/.config/wezterm/utils/keymap.lua ~/.config/wezterm/utils/keymap.lua

# Yazi
mkdir -p ~/.config/yazi
ln -s ~/dotfiles/user/.config/yazi/yazi.toml ~/.config/yazi/yazi.toml
ln -s ~/dotfiles/user/.config/yazi/theme.toml ~/.config/yazi/theme.toml
ln -s ~/dotfiles/user/.config/yazi/keymap.toml ~/.config/yazi/keymap.toml

# LazyGit
mkdir '~/Library/Application\ Support/lazygit'
ln -s ~/dotfiles/user/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

# AeroSpace
ln -s ~/dotfiles/user/.config/aerospace ~/.config/aerospace

# gdu
mkdir ~/.config/gdu && ln -s ~/dotfiles/user/.config/gdu/gdu.yaml ~/.config/gdu/gdu.yaml
