on run argv
    tell application "System Events" to key code (item 1 of argv) using {option down}
end run
