#!/usr/bin/env bash

print_in_color() {
    reset='\033[0m'
    printf "$1$2${reset}\n"
} 

print_green() {
    green='\033[92m'
    print_in_color $green "$1"
}

print_red() {
    red='\033[91m'
    print_in_color $red "$1"
}

print_yellow() {
    yellow='\033[93m'
    print_in_color $yellow "$1"
}

print_cyan_bold() {
    cyan='\033[1;36m'
    print_in_color $cyan "$1"
}

print_magenta_bold() {
    magenta='\033[1;35m'
    print_in_color $magenta "$1"
}

print_success() {
    print_green "   [✔] $1"
}

print_warning() {
    print_yellow "   [!] $1"
}

print_error() {
    print_red "   [✖] $1 $2"
}

print_title() {
    print_cyan_bold "  $1"
}

print_header() {
    print_magenta_bold "\n• $1\n"
}

print_error_stream() {
    while read -r line; do
        print_error "↳ ERROR: $line"
    done
}

print_result() {
    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"
}

execute() {

    local -r CMDS="$1"
    local -r MSG="${2:-$1}"
    local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

    local exitCode=0
    local cmdsPID=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If the current process is ended,
    # also end all its subprocesses.

    set_trap "EXIT" "kill_all_subprocesses"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Execute commands in background

    eval "$CMDS" \
        &> /dev/null \
        2> "$TMP_FILE" &

    cmdsPID=$!

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Show a spinner if the commands
    # require more time to complete.

    show_spinner "$cmdsPID" "$CMDS" "$MSG"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait for the commands to no longer be executing
    # in the background, and then get their exit code.

    wait "$cmdsPID" &> /dev/null
    exitCode=$?

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Print output based on what happened.

    print_result $exitCode "$MSG"

    if [ $exitCode -ne 0 ]; then
        print_error_stream < "$TMP_FILE"
    fi

    rm -rf "$TMP_FILE"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    return $exitCode

}

set_trap() {
    trap -p "$1" | grep "$2" &> /dev/null \
        || trap '$2' "$1"
}

show_spinner() {

    local -r FRAMES='/-\|'

    # shellcheck disable=SC2034
    local -r NUMBER_OR_FRAMES=${#FRAMES}

    local -r CMDS="$2"
    local -r MSG="$3"
    local -r PID="$1"

    local i=0
    local frameText=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Note: In order for the Travis CI site to display
    # things correctly, it needs special treatment, hence,
    # the "is Travis CI?" checks.

    if [ "$TRAVIS" != "true" ]; then

        # Provide more space so that the text hopefully
        # doesn't reach the bottom line of the terminal window.
        #
        # This is a workaround for escape sequences not tracking
        # the buffer position (accounting for scrolling).
        #
        # See also: https://unix.stackexchange.com/a/278888

        printf "\n\n\n"
        tput cuu 3

        tput sc

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Display spinner while the commands are being executed.

    while kill -0 "$PID" &>/dev/null; do

        frameText="   [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Print frame text.

        if [ "$TRAVIS" != "true" ]; then
            printf "%s\n" "$frameText"
        else
            printf "%s" "$frameText"
        fi

        sleep 0.2

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # Clear frame text.

        if [ "$TRAVIS" != "true" ]; then
            tput rc
        else
            printf "\r"
        fi

    done
}
