SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.US') LABEL='❮US❯' ;;
'com.apple.keylayout.Ukrainian'*) LABEL='❮UK❯' ;;
'com.apple.keylayout.Russian'*) LABEL='❮RU❯' ;;
esac

sketchybar --set $NAME label="$LABEL"
