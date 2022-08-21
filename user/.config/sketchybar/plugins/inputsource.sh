SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.US') LABEL='❮US❯' ;;
'com.apple.keylayout.RussianWin') LABEL='❮RU❯' ;;
esac

sketchybar --set $NAME label="$LABEL"
