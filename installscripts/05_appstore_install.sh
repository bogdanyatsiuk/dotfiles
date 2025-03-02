 #!/usr/bin/env bash

print_header "Mac AppStore apps Install"

apps=(
    "973134470:Be Focused - Focus Timer"
    "1497527363:Blurred"
    "1388020431:DevCleaner for Xcode"
    "1274495053:Microsoft To Do"
    "1410709951:Smart Countdown Timer"
    "1524738503:Tools for Xcode"
    "1044549675:Elmedia Video Player"
    "784801555:Microsoft OneNote"
    "1564031042:Omnivore"
    "1352778147:Bitwarden"
    "1149778308:iCompta"
    )

for app in "${apps[@]}"
do
    if [[ $app =~ ":" ]]
    then
        id=${app%%:*}
        title=${app#*:}
        execute "mas install ${id}" "${title}"
    else
        print_title "$app"
    fi
done

