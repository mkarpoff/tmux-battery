#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_battery_charging() {
    # percentage displayed in the 2nd field of the 2nd row
    for i in $(ls /sys/class/power_supply/);do
        type=$(<"/sys/class/power_supply/$i/type")
        if [ "$type" != "Battery" ]; then
            charging=$(<"/sys/class/power_supply/$i/online")
            if [ "$charging" == "1" ]; then 
                printf '1' 
                return 0 
            fi
        fi
    done
    printf "0"
}

main() {
    print_battery_charging
}
main
