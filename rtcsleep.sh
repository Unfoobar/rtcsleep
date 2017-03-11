#!/bin/bash

# RTCSleep: Simple shutdown tool to automatically start your machine on selected days of month.
# unfoobar@unfoobar.com
# https://github.com/Unfoobar/rtcsleep

start_dom=1             # first day of month to start
wake_period=3           # period of days until next start
wake_time="01:00:00"    # time to start
sleep_mode="off"		# ACPI-suspend-mode for sleeping time

# today
dom=$(($(date +%e) + 0))

# check if start time is already over for today
if [ $(($(date -d  "$(date +%F) $wake_time" +%s))) -gt $(($(date +%s))) ]
then
	i=0
else
	i=1
fi

# next start day
ndom=$(($(date -d "+$i days" +%e) + 0))
while [ $(($ndom % $wake_period)) -ne $start_dom ];
do
	i=$(($i+1))
	ndom=$(($(date -d "+$i days" +%e) + 0))
done

# next start date + time
next="$(date -d "+$i days" +%F) $wake_time"

# seconds until next start
sec=$(($(date -d "$next" +%s) - $(date +%s)))

# go to sleep
/usr/sbin/rtcwake -m "$sleep_mode" -s $sec