#!/bin/bash

# Fetch data from ipconfig.me and display it
echo "Fetching IP configuration..."
IP_DATA=$(curl -sL ipconfig.me)
echo "Current IP configuration:"
echo "$IP_DATA"

# Prompt the user to enter a SESSION_KEY
echo "Please enter your SESSION_KEY:"
read SESSION_KEY

# Using the entered SESSION_KEY, perform the curl operation with cookie handling
curl -c /config/transmission-home/mam.cookies -b "mam_id=$SESSION_KEY" "https://t.myanonamouse.net/json/dynamicSeedbox.php"
