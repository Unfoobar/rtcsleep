# rtcsleep
Simple shutdown tool to automatically start your machine on selected days of month.

With this script you can let your linux machine start automatically on chosen days of month. 
Just download the bash-script, edit the parameters for the first day of month to start, the restart period and the start time. By calling the configured script, your machine will be go into suspend mode and restart automatically on the next chosen date using *rtcwake*.

**Example:**

    start_dom=2             # first day of month to start is the 2nd
    wake_period=5           # period of days until next start => 2nd, 7th, 12th, ...
    wake_time="01:00:00"    # wake up time is 1am
    sleep_mode="off"        # the machine should go to soft-off (acpi-suspend-mode s5)
