#!/usr/bin/env bash

source installscripts/utils.sh

source installscripts/01_xcode.sh
source installscripts/02_brew.sh
source installscripts/03_cask_install.sh
source installscripts/04_brew_install.sh
source installscripts/05_appstore_install.sh
source installscripts/06_gem_install.sh
source installscripts/07_npm_instal.sh
source installscripts/08_symlink.sh
source installscripts/09_fonts_install.sh
source installscripts/10_macos_settings.sh
source installscripts/11_tools_config.sh
source installscripts/12_other.sh

print_yellow "\n Complete!"
