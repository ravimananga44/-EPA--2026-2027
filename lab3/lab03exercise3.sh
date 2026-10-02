#!/bin/bash
# lab03_exercise3.sh
# Same check as Exercises 1 and 2, but the user chooses where the result goes:
# screen - print to the screen (Exercise 1 behaviour)
# file - append to a log file with a date/time stamp (Exercise 2 behaviour)
# Usage: ./lab03_exercise3.sh <max_processes> <screen|file>
# Log file used when the user picks "file"
logfile="lab03_exercise3.log"
# Make sure exactly two arguments were passed in
if [ $# -ne 2 ]; then
 echo "Usage: $0 <max_processes> <screen|file>"
 exit 1
fi
# Make sure the first argument is a positive whole number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
 echo "Error: '$1' is not a valid number"
 exit 1
fi
# Make sure the second argument is either "screen" or "file"
if [ "$2" != "screen" ] && [ "$2" != "file" ]; then
 echo "Error: output must be 'screen' or 'file', not '$2'"
 exit 1
fi
max=$1
mode=$2
# Count running processes (--no-headers stops the header line being counted)
count=$(ps -e --no-headers | wc -l)
# Pick the message based on the process count
if [ "$count" -gt "$max" ]; then
 message="Maximum number of processes exceeded"
else
 message="The maximum number of processes NOT exceeded"
fi
# Send the message wherever the user asked
if [ "$mode" = "screen" ]; then
 echo "$message"
else
 timestamp=$(date '+%Y-%m-%d %H:%M:%S')
 echo "$timestamp - $message" >> "$logfile"
fi
