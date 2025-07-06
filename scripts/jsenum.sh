#!/bin/bash

FILESh=(target_*)
TOTALjs=${#FILESh[@]}
CURRENTjs=0
START_TIMEjs=$(date +%s)
LAST_NOTIFYjs=$START_TIMEjs

for h in "${FILESh[@]}"; do
  ((CURRENTjs++))
  PERCENTjs=$((CURRENTjs * 100 / TOTALjs))
  echo ""
  echo "Scanning $h ($CURRENTjs of $TOTALjs) $PERCENTjs% complete..."
  cat "$h" | while read url; do python3 ~/Downloads/SecretFinder/SecretFinder.py  -i $url -o cli; done | anew ../secretfinder.txt
  NOWjs=$(date +%s)
  ELAPSEDjs=$((NOWjs - LAST_NOTIFYjs))

  if [ "$ELAPSEDjs" -ge 3600 ]; then
    echo "Progress: $CURRENTjs of $TOTALjs files scanned ($PERCENTjs%)" | notify
    LAST_NOTIFYjs=$NOWjs
  fi
done

# Final message
echo "Secretfinder finished scan completed: $CURRENTjs of $TOTALjs files processed (100%)" | notify
