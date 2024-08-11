SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.US') LABEL='❮US❯' ;;
'com.apple.keylayout.Ukrainian'*) LABEL='❮UK❯' ;;
'com.apple.keylayout.Russian'*) LABEL='❮RU❯' ;;
'io.github.colemakmods.keyboardlayout.colemakdh.colemak'*) LABEL='<CO>' ;;
esac

sketchybar --set $NAME label="$LABEL"
