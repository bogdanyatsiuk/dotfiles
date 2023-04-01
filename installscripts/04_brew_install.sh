#!/usr/bin/env bash

print_header "Brew Install"

formulaes=(
    "mas:Mac App Store CLI"
    "Node JS" # Node JS
    "node:Node.js"
    "File Structure Navigation" # File Structure Navigation
    "broot:broot"
    "lsd:lsd"
    "exa:exa"
    "ranger:ranger"
    "tree:tree"
    "vifm:vifm"
    "z:z" # replace with zoxide
    "Search tools" # Search tools
    "ack:ack"
    "fd:fd"
    "fdupes:fdupes"
    "fzf:FZF"
    "fzy:fzy"
    "jdupes:jdupes"
    "pdfgrep:pdfgrep"
    "ripgrep:ripgrep"
    "the_silver_searcher:The Silver Searcher"
    "Compression" # Compression
    "brotli:brotli"
    "p7zip:7-Zip"
    "unar:unar"
    "xz:xz"
    "Documenting" # Documenting
    "aspell:aspell"
    "gettext:gettext"
    "graphviz:Graphviz"
    "pandoc:Pandoc"
    "plantuml:PlantUML"
    "poppler:poppler"
    "staruml:StarUML"
    "Version Control" # Version Control
    "diff-so-fancy:diff-so-fancy"
    "git-flow:git-flow"
    "git-lfs:git-lfs"
    "git-delta:git-delta"
    "git:Git"
    "jesseduffield/lazygit/lazygit:LazyGit"
    "Editors / Viewers" # Editors / Viewers
    "bat:bat"
    "neovim:NeoVim"
    "Docs & Help" # Docs & Help
    "tldr:tldr"
    "howdoi:howdoi"
    "vim:Vim"
    "Python" # Python
    "pipenv:pipenv"
    "Tasks" # Tasks
    "task:Taskwarrior"
    "tasksh:Tasksh"
    "timewarrior:Timewarrior"
    "Graphics" # Graphics
    "gifify:gifify"
    "gifsicle:Gifsicle"
    "gnuplot:Gnuplot"
    "graphicsmagick:GraphicsMagick"
    "imagemagick:ImageMagick"
    "jp2a:jp2a"
    "pla:pla"
    "pqiv:pqiv"
    "Web" # Web
    "ddgr:ddgr"
    "googler:googler"
    "w3m:w3m"
    "wget:wget"
    "Different Tools" # Different Tools
    "cheat:cheat"
    "cloc:cloc"
    "gcal:gCal"
    "gotop:gotop"
    "hr:hr"
    "htop:htop"
    "insect:insect"
    "jq:jq"
    "mackup:mackup"
    "navi:navi"
    "neofetch:neofetch"
    "radare2:Reverse engineering framework"
    "screenfetch:screenfetch"
    "shellcheck:shellcheck"
    "trash:trash"
    "Video" # Video
    "ffmpeg:FFmpeg"
    "mps-youtube:mps-youtube"
    "youtube-dl:youtube-dl"
    "Windows Management" # Windows Management
    "koekeishiya/formulae/yabai:yabai"
    "koekeishiya/formulae/skhd:skhd"
    "FelixKratz/formulae/sketchybar:SketchyBar"
    "yqrashawn/goku/goku:Goku"
#    "Zsh" # Zsh
    "starship:starship"
    "zsh:Zsh"
    "zsh-autosuggestions:zsh-autosuggestions"
    "zsh-completions:zsh-completions"
    "zsh-history-substring-search:zsh-history-substring-search"
    "zsh-syntax-highlighting:zsh-syntax-highlighting"
    "Tmux" # Tmux
    "tmux:tmux"
    "tmuxinator:tmuxinator"
    "Xcode / iOS" # Xcode / iOS
    "bluepill:bluepill"
    "carthage:Carthage"
    "chisel:chisel"
    "cocoapods:Cocoapods"
    #"ideviceinstaller:ideviceinstaller"
    #"ios-deploy:ios-deploy"
    #"ios-sim:ios-sim"
    "swiftformat:swiftformat"
    "swiftlint:SwiftLint"
    )

for formula in "${formulaes[@]}"
do
    if [[ $formula =~ ":" ]]
    then
        command=${formula%%:*}
        title=${formula#*:}
        execute "brew install ${command}" "${title}"
    else
        print_title "$formula"
    fi
done

#= Development
# bcal
# rebound
# bitwise

#= Docker
# dockly

#= Tools
# terjira
# gcalcli
# s //search in web
# carbon-now-cli
# awesome-finder

# open-pip-cli

# localtunnel / ngrok
# speedtest-net

# has
# yank

# howdoi
# how2
# tldr

# battery-level-cli

# trash-cli
# node-rename-cli
# tre

# xcbuild
# xcpretty

# SourceKitten
# SourceKittenDaemon

# SpaceVim
# taskjuggler

# autojump
# fz?
# z.lua?

# exa
# delta
