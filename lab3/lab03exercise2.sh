#!/bin/bash
# lab03_exercise2.sh
# Same check as Exercise 1, but the result is appended to a log file
# (using >>) with a date/time stamp, instead of being printed to the screen.
# Usage: ./lab03_exercise2.sh <max_processes>
# Log file the results are written to
logfile="lab03_exercise2.log"
# Make sure exactly one argument was passed in
# (input errors still go to the screen so the user sees them)
if [ $# -ne 1 ]; then
 echo "Usage: $0 <max_processes>"
 exit 1
fi
# Make sure the argument is a positive whole number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
 echo "Error: '$1' is not a valid number"
 exit 1
fi
max=$1
# Count running processes (--no-headers stops the header line being counted)
count=$(ps -e --no-headers | wc -l)
# Date/time stamp for the log entry, e.g. 2026-10-02 13:45:10
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
# Append the result to the log file instead of printing it
if [ "$count" -gt "$max" ]; then
 echo "$timestamp - Maximum number of processes exceeded" >> "$logfile"
else
 echo "$timestamp - The maximum number of processes NOT exceeded" >> "$logfile"
fi 
