#!/bin/bash
cd ~/notify/
FILE="results.txt"
LAST_LINES=0

echo "Monitoring $FILE for new results every 10 seconds..."

while true; do
    CURRENT_LINES=$(wc -l < "$FILE")

    if [ "$CURRENT_LINES" -gt "$LAST_LINES" ]; then
        NEW_LINES=$((CURRENT_LINES - LAST_LINES))
        echo -e "[$(date)] $NEW_LINES \nNew results found!" | notify
        tail -n "$NEW_LINES" "$FILE" | notify
        LAST_LINES=$CURRENT_LINES
    fi
    sleep 10
done
