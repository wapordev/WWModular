#!/usr/bin/env sh
set -e

function bye {
    echo "Goodbye"
    exit 1
}
function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
        esac
    done
}

yes_or_no 'did you run export.sh?' || bye
yes_or_no 'did you change the html export background color? ("#222" -> "#1d2b53")' || bye

butler push wwmodular_html waporwave/wwmodular:html
butler push wwmodular.bin/wwmodular_windows.zip waporwave/wwmodular:windows
butler push wwmodular.bin/wwmodular_linux.zip waporwave/wwmodular:linux
butler push wwmodular.bin/wwmodular_osx.zip waporwave/wwmodular:osx
butler push wwmodular.bin/wwmodular_raspi.zip waporwave/wwmodular:raspi
# butler push wwmodular.p8.png waporwave/wwmodular:png

# echo "done. remember to push to lexaloffle too!"
# echo "https://www.lexaloffle.com/bbs/?pid=linecook"
