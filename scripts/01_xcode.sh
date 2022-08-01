#!/usr/bin/env bash

print_header "Xcode"

are_xcode_clt_installed() {
    xcode-select -p &> /dev/null
}

is_xcode_installed() {
    [ -d "/Applications/Xcode.app" ]
}

install_xcode_clt() {

    # If necessary, prompt user to install
    # the `Xcode Command Line Tools`.

    xcode-select --install #&> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the `Xcode Command Line Tools` are installed.

    execute \
        "until are_xcode_clt_installed; do \
            sleep 5; \
         done" \
        "Xcode Command Line Tools"
}

install_xcode() {

    # If necessary, prompt user to install `Xcode`.

    if ! is_xcode_installed; then
        open "macappstores://itunes.apple.com/en/app/xcode/id497799835"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `Xcode` is installed.

    execute \
        "until is_xcode_installed; do \
            sleep 5; \
         done" \
        "Xcode.app"
}

set_xcode_developer_directory() {

    sudo xcode-select -switch "/Applications/Xcode.app/Contents/Developer" &> /dev/null
    print_result $? "Make 'xcode-select' developer directory point to the appropriate directory from within Xcode.app"

}

agree_with_xcode_licence() {
    sudo xcodebuild -license accept &> /dev/null
    print_result $? "Agree to the terms of the Xcode licence"
}

main() {
    print_title "Xcode"

    #install_xcode_clt
    install_xcode
    #set_xcode_developer_directory
    agree_with_xcode_licence
}

main
