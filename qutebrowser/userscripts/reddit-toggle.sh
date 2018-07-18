#! /usr/bin/env bash

NEW_URL=$(echo "$QUTE_URL" | sed -e 's/old\.reddit\.com/www.reddit.com/;t;s/\(www\.\)\?reddit\.com/old.reddit.com/')
echo "open $NEW_URL" >> "$QUTE_FIFO"
