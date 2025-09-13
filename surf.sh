#!/bin/sh

bookmarks="google
gmail
youtube
discord
telegram
chatgpt
github
aliexpress
cobalt.tools
espwebtool
steamdb"

while true; do
    choice=$(printf "%s\n" "$bookmarks" | rofi -dmenu -p "search or bookmark")

    # exit if nothing selected
    [ -z "$choice" ] && exit 0

    case "$choice" in
        gmail) surf "https://mail.google.com" ;;
        google) surf "https://google.com" ;;
        youtube) surf "https://youtube.com" ;;
        discord) surf "https://discord.com/app" ;;
        telegram) surf "https://web.telegram.org" ;;
        chatgpt) surf "https://chat.openai.com" ;;
        aliexpress) surf "https://aliexpress.com" ;;
        cobalt.tools) surf "https://cobalt.tools" ;;
        github) surf "https://github.com" ;;
        espwebtool) surf "https://espressif.github.io/esp-web-tools/" ;;
        steamdb) surf "https://steamdb.info" ;;
        *)
            if echo "$choice" | grep -qE '^https\?://'; then
                surf "$choice"
            else
                surf "https://www.google.com/search?q=$(printf '%s' "$choice" | sed 's/ /+/g')"
            fi
            ;;
    esac
done
