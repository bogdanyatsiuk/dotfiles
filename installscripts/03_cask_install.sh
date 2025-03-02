#!/usr/bin/env bash

print_header "Cask Install"

formulaes=(
    "Windows" # Windows
    "nikitabobko/tap/aerospace:AeroSpace"
    "Terminals" # Terminals
    "wezterm:wezterm"
    "ghostty:ghostty"
    "Browsers" # Browsers
#    "firefox:Mozilla Firefox"
    "google-chrome:Google Chrome"
    "brave-browser:Brave"
    "arc:Arc"
    "tor-browser:Tor Browser"
    "Editors" # Editors
    "hex-fiend:Hex Fiend"
    "sublime-text:Sublime Text"
    "swiftformat-for-xcode:SwiftFormat for Xcode"
    "visual-studio-code:Microsoft Visual Studio Code"
    "Communication" # Communication
    "slack:Slack"
    "telegram:Telegram"
    "Networking" # Networking
    "altair-graphql-client:Altair GraphQL Client"
    #"charles:Charles"
#    "graphiql:GraphiQL"
#    "graphql-playground:GraphQL Playground"
#    "insomnia:Insomnia"
    #"postman:Postman"
    "proxyman:Proxyman"
    "Documentation/Drawing" # Documentation/Drawing
    "drawio:draw.io Desktop"
    "yed:yWorks yEd"
    "Databases" # Databases
    "dbeaver-community:DBeaver Community Edition"
    "Graphics" # Graphics
    "gimp:GIMP"
    #"inkscape:Inkscape"
    "imagealpha:ImageAlpha"
    "imageoptim:ImageOptim"
    "licecap:LICEcap"
    "Documents/Books" # Documents/Books
    "kindle:Kindle for Mac"
    # "ONLYOFFICE:onlyoffice"
    "djview:djview"
    "Video" # Video
    "vlc:VLC media player"
    "Connectivity" # Connectivity
    "transmission:Transmission"
    "tunnelblick:Tunnelblick"
    "Notes" # Notes
#    "joplin:Joplin"
    "notion:Notion"
    "obsidian:Obsidian"
    #"raindropio:Raindrop.io"
    "zotero:Zotero"
    "Tools" # Tools
    "appcleaner:AppCleaner"
    "raycast:Raycast"
    #"spacelauncher:SpaceLauncher"
    "sourcetree:Atlassian SourceTree"
    "the-unarchiver:The Unarchiver"
    "quicklook-json:quick look JSON"
    "qlmarkdown:QLMarkdown"
    "Misc" # Misc
    "keycastr:Key Castr"
    "Android" # Android
#    "android-ndk:Android NDK"
#    "android-platform-tools:Android SDK Platform-Tools"
#    "android-sdk:android-sdk"
    #"android-studio:Android Studio"
    )

for formula in "${formulaes[@]}"
do
    if [[ $formula =~ ":" ]]
    then
        command=${formula%%:*}
        title=${formula#*:}
        execute "brew install --cask ${command}" "${title}"
    else
        print_title "$formula"
    fi
done
