#!/bin/bash

Dir="/home/a/Dropbox/wallpaper"

if [ ! -d "$Dir" ]; then 
    echo "Not Exist $Dir"
    exit 1
fi

SetBG () {
while IFS= read -rd '' file; do list+=("$file"); done < <(find "$Dir" ! -type d -print0)
TotalFiles=${#list[@]}
RandomNumber=$(( $RANDOM % $TotalFiles ))
test ! $RandomNumber = 0 || RandomNumber=1

RandomFile="${list[RandomNumber]}"

#echo "Selected File: $RandomFile"
feh --bg-fill "${RandomFile}"
# exec nitrogen --set-fill "$RandomFile"

}

while true; do
    SetBG
    sleep 20m
done
