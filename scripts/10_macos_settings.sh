#!/usr/bin/env bash

print_header "macOS Settings"

# Requesting passowrd
sudo -v

#==============================
# Directories
#==============================
execute "mkdir ~/Developer ~/Documents/Screenshots ~/Downloads/Temp" \
            "Create directories"

#==============================
# Interface
#==============================
print_title "Interface"

execute 'defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark" && \
         defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically' \
            "Set Dark Interface Style"

execute 'defaults write NSGlobalDomain AppleAquaColorVariant -int 1'

#==============================
# Finder
#==============================
print_title "Finder"

execute "defaults write com.apple.finder CreateDesktop -bool false" \
            "Hide Desktop icons"

execute "defaults write com.apple.finder AppleShowAllFiles -bool true" \
            "Show hidden files by default"

execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true" \
            "Show file extensions in Finder"

execute "defaults write com.apple.finder ShowStatusBar -bool true" \
            "Show status bar"

execute "defaults write com.apple.finder ShowPathbar -bool true" \
            "Show path bar"

execute "defaults write com.apple.finder QLEnableTextSelection -bool true" \
            "Allow text selection in Quick Look"

execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" \
            "Keep folders on top when sorting by name"

execute 'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"' \
            "When performing a search, search the current folder by default"

execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
            "Disable the warning when changing a file extension"

# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `clmv`, `glyv`
execute 'defaults write com.apple.finder FXPreferredViewStyle -string "clmv"' \
            "Use columns view in all Finder windows by default"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
            "Hide recent tags"

execute 'defaults write com.apple.finder NewWindowTarget -string "PfHm" && \
        defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"' \
            "Set Home folder as the default location for new Finder windows"

execute "defaults write com.apple.finder QuitMenuItem -bool true" \
            "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"

#==============================
# Dock
#==============================
print_title "Dock"

execute "defaults write com.apple.dock autohide -bool true" \
            "Autohide dock"

execute "defaults write com.apple.dock tilesize -int 54" \
            "Set the icon size of Dock items to 54 pixels"

execute "defaults write com.apple.dock magnification -bool true && \
        defaults write com.apple.dock largesize -int 72" \
            "Enable magnification"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
            "Minimize windows into their application’s icon"

execute "defaults write com.apple.dock show-recents -bool false" \
    "Do not show recent applications in Dock"

#==============================
# Keyboard
#==============================
print_title "Keyboard"

execute "defaults delete com.apple.HIToolbox AppleEnabledInputSources" \
            "Delete the default layouts"

execute "defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>'" \
            "Add U.S. keyboard layout"

execute "defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>-2354</integer><key>KeyboardLayout Name</key><string>Ukrainian-PC</string></dict>'" \
            "Add Ukrainian keyboard layout"

execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
    "Set delay until repeat"

execute "defaults write -g KeyRepeat -int 1" \
    "Set the key repeat rate to fast"

execute "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3" \
    "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"

execute "defaults write NSGlobalDomain com.apple.keyboard.fnState -int 1" \
    "Use F[1-12] keys on the external keyboard"

#==============================
# Trackpad
#==============================
print_title "Trackpad"

execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
         defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 && \
         defaults write -g com.apple.mouse.tapBehavior -int 1 && \
         defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1" \
    "Enable 'Tap to click'"

execute "defaults write com.apple.dock showMissionControlGestureEnabled -bool true && \
        defaults write com.apple.dock showAppExposeGestureEnabled -bool true && \
        defaults write com.apple.dock showDesktopGestureEnabled -bool true && \
        defaults write com.apple.dock showLaunchpadGestureEnabled -bool true" \
        "Enable extra multifinger gestures (such as three finger swipe down = app expose)"

execute "defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true && \
        defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144" \
            "Use scroll gesture with the Ctrl (^) modifier key to zoom"

execute "defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true" \
        "Follow the keyboard focus while zoomed in"

#==============================
# Different
#==============================
print_title "Different"

execute 'defaults write NSGlobalDomain AppleLanguages -array "en-UA" "ua-UA"' \
        "Languages"

execute 'defaults write NSGlobalDomain AppleLocale -string "en_UA"' \
        "Locale"

execute 'defaults write com.apple.menuextra.clock DateFormat -string "EEE HH:mm"' \
        "Time format in menu"

execute "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false" \
            "Disable auto-correct"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
        defaults write com.apple.screensaver askForPasswordDelay -int 5" \
            "Require password 5 seconds after sleep or screen saver begins"

execute "defaults write com.apple.screencapture show-thumbnail -bool FALSE" \
            "Disable Floating Screenshot Thumbnail"

execute "defaults write com.apple.screencapture location ~/Documents/Screenshots" \
        "Save screenshots to ~/Documents/Screenshots"

#==============================
# Transmission
#==============================
print_title "Transmission"

execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
    "Delete the original torrent files"

execute "defaults write org.m0k.transmission DownloadAsk -bool false" \
    "Don’t prompt for confirmation before downloading"

execute "defaults write org.m0k.transmission CheckRemoveDownloading -bool true" \
    "Don’t prompt for confirmation before removing non-downloading active transfers"

execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' && \
         defaults write org.m0k.transmission DownloadFolder -string '$HOME/Downloads/torrents'" \
    "Use '~/Downloads/torrents' to store complete downloads"

execute "defaults write org.m0k.transmission WarningDonate -bool false" \
    "Hide the donate message"

execute "defaults write org.m0k.transmission WarningLegal -bool false" \
    "Hide the legal disclaimer"

execute "defaults write org.m0k.transmission RandomPort -bool true" \
    "Randomize port on launch"


#==============================
# Xcode
#==============================
print_title "Xcode"

execute "defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true && \
         defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 120 && \
         defaults write com.apple.dt.Xcode DVTTextShowMinimap -bool false && \
         defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true && \
         defaults write com.apple.dt.Xcode IDECopyFilesToTargetGroup -bool true && \
         defaults write com.apple.dt.Xcode IDEFileExtensionDisplayMode -bool true && \
         defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool true && \
         defaults write com.apple.dt.Xcode XCFontAndColorCurrentDarkTheme -string 'Dusk.xccolortheme'"


#==============================
# iTerm2
#==============================
print_title "iTerm2"
execute "defaults write com.googlecode.iterm2 AppleEnabledInputSources -array-add '{
    AllowClipboardAccess = 1;
    Control = 1;
    HapticFeedbackForEsc = 0;
    HideMenuBarInFullscreen = 1;
    HideScrollbar = 0;
    HideTab = 1;
    \"New Bookmarks\" = ({
            \"Initial Text\" = \"tmux attach-session || tmux new -s main\";
            \"Normal Font\" = \"MesloLGMNerdFontComplete-Regular 13\";
            \"Option Key Sends\" = 2;
            \"Window Type\" = 12;
        }
    );
    NoSyncBFPRecents = (
        \"MesloLGM Nerd Font\"
    );
    SoundForEsc = 0;
    SwitchPaneModifier = 4;
    SwitchTabModifier = 6;
    SwitchWindowModifier = 9;
    TabStyleWithAutomaticOption = 5;
    TabViewType = 0;
    VisualIndicatorForEsc = 0;
}'" \
            "iTerm2 configuration"

