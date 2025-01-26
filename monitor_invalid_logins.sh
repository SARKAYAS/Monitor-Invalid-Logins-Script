#!/bin/bash

LOGFILE="/var/log/auth.log"
PATTERN="Failed password for invalid user"
RECIPIENT="email@address.com"
SUBJECT="Invalid Login Attempts Detected"

while IFS= read -r line; do
    if [[ $line =~ $PATTERN ]]; then
        rhost=$(echo "
$line
" | awk -F'[= ]' '{print $(NF-4)}')
        user=$(echo "
$line
" | awk -F'[= ]' '{print $(NF-5)}')
        message+="rhost: 
$rhost
, user: 
$user
"$'\n'
    fi
done < "
$LOGFILE
"

if [[ -n $message ]]; then
    echo -e "Invalid User Login Attempts detected:\n
$message
" | mail -s "
$SUBJECT
" $RECIPIENT
fi
             
