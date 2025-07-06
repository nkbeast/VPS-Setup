#!/bin/bash

FILES=(target_*)
TOTAL=${#FILES[@]}
CURRENT=0
START_TIME=$(date +%s)
LAST_NOTIFY=$START_TIME

for f in "${FILES[@]}"; do
  ((CURRENT++))
  PERCENT=$((CURRENT * 100 / TOTAL))
  echo ""
  echo "Scanning $f ($CURRENT of $TOTAL) $PERCENT% complete..."
  
  cat "$f" | gau | tee ../gaurls.txt

  NOW=$(date +%s)
  ELAPSED=$((NOW - LAST_NOTIFY))

  if [ "$ELAPSED" -ge 3600 ]; then
    echo "Progress: $CURRENT of $TOTAL files scanned ($PERCENT%)" | notify
    LAST_NOTIFY=$NOW
  fi
done

# Final message
echo "Waybackurl scan completed: $CURRENT of $TOTAL files processed (100%)" | notify
