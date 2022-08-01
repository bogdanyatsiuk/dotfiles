#!/usr/bin/env bash

source scripts/utils.sh

source scripts/01_xcode.sh
source scripts/02_brew.sh
source scripts/03_cask_install.sh
source scripts/04_brew_install.sh
source scripts/05_appstore_install.sh
source scripts/06_gem_install.sh
source scripts/07_npm_instal.sh
source scripts/08_symlink.sh
source scripts/09_fonts_install.sh
source scripts/10_macos_settings.sh
source scripts/11_tools_config.sh
source scripts/12_other.sh

print_yellow "\n Complete!"
