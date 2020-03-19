#!/bin/sh

duetoday=$(grep "$(date -I)" ~/Documents/life/README.org | grep -c -v "x")
dueweek=0
weekday=0

while [ "$weekday" -le 7 ]; do
    dueweek=$((dueweek + $(grep "$(date -I --date="$weekday day")" ~/Documents/life/README.org | grep -c -v "x")))
    weekday=$(( weekday + 1 ))
done

if [ "$dueweek" -gt 0 ]; then
   echo "Today:$duetoday Week:$dueweek"
else
   echo "Nothing Due" 
fi
