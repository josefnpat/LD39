#!/bin/sh

love src

echo "please move crap from getSaveDirectory to build/cards/*"
read -rsp $'Press any key to continue...\n' -n1 key

cd build
sh montage.sh
