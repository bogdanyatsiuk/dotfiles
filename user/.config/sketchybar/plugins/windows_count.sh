#!/usr/bin/env sh

cnt=$(yabai -m query --windows --space $1 | jq length)

case ${cnt} in
'1') echo "¹" ;;
'2') echo "²" ;;
'3') echo "³" ;;
'4') echo "⁴" ;;
'5') echo "⁵" ;;
'6') echo "⁶" ;;
'7') echo "⁷" ;;
'8') echo "⁸" ;;
'9') echo "⁹" ;;
'10') echo "¹⁰" ;;
'11') echo "¹¹" ;;
'12') echo "¹²" ;;
'13') echo "¹³" ;;
'14') echo "¹⁴" ;;
'15') echo "¹⁵" ;;
'16') echo "¹⁶" ;;
'17') echo "¹⁷" ;;
'18') echo "¹⁸" ;;
'19') echo "¹⁹" ;;
'20') echo "²⁰" ;;
esac
