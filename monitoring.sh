#!/bin/bash
wall -n $'\t\b\bArchitecture\t:' `uname -a`$'\n\t\b\b'\
$'CPU Physical\t:' `grep -c processor /proc/cpuinfo`$'\n\t\b\b'\
$'vCPU\t\t:' `grep -c processor /proc/cpuinfo`$'\n\t\b\b'\
$'Memory Usage\t:' `free --mega | awk 'NR==2{printf "%s/%sMB\t(%.2f%%)", $3, $2, $3*100/$2}'`$'\n\t\b\b'\
$'Disk Usage\t:' `df -H | awk '$NF=="/"{printf "%d/%dGB (%s)", $3, $2, $5}'`$'\n\t\b\b'\
$'CPU Load\t\t:' `top -bn1 | grep load | awk '{printf "%.2f%%", $(NF-2)}'`$'\n\t\b\b'\
$'Last Boot\t\t:' `who -b | awk '{print $3" "$4}'`$'\n\t\b\b'\
$'LVM Use\t\t:' `if lsblk | grep -q lvm; then echo "A'ight"; else "Nah";fi`$'\n\t\b\b'\
$'Connected TCP\t:' `ss | grep tcp | wc -l`$'\n\t\b\b'\
$'Logged Users\t:' `who | wc -l`$'\n\t\b\b'\
$'Network\t\t: IP' `hostname -I` `ip a | grep link/ether | awk '{print "\t\tMAC " $2}'`$'\n\t\b\b'\
$'Sudoers\t\t:' `getent group sudo | cut -d: -f4`
