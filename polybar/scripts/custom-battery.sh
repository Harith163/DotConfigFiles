#!/bin/sh

## My custom written battery status script. 
bat_status=$(acpi | awk '{print $3}' | sed -e "s/,$//") 
bat_charge=$(acpi | awk '{print $4}' | sed -e "s/%,$//") 

if [ -a bat_status="Charging" ]; then
    icon_status=""
else
    icon_status=""
fi

if [[ bat_charge=100 ]]; then
    icon_charge=""
elif [[ bat_charge<100 && bat_charge>=75 ]]; then
    icon_charge=""
elif [[ bat_charge<75 && bat_charge>=50 ]]; then
    icon_charge=""
elif [[ bat_charge<50 && bat_charge>=25 ]]; then
    icon_charge=""
elif [[ bat_charge<25 && bat_charge>=0 ]]; then
    icon_charge=""
else
    echo "ERROR #2"
fi

echo "$icon_status $icon_charge  $bat_charge%"
