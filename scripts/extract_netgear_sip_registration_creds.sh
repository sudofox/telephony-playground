#!/bin/bash

# basic auth creds for the cm1150v
AUTH=""

RESULT=$(curl -s 'http://192.168.100.1/MtaEventLogRetail.htm' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' \
-H 'Accept-Language: en-US,en;q=0.5' \
-H 'Accept-Encoding: gzip, deflate' \
-H "Authorization: Basic $AUTH" \
-H 'Connection: keep-alive' \
-H 'Cookie: XSRF_TOKEN=15871899' \
-H 'Upgrade-Insecure-Requests: 1' \
| grep -Po " TableTagValueList....\K.+?(?=';)")

printf "$(echo "$RESULT" |grep -Po ">\KREGISTER.+?(?=\|)")"| sed -e $'s/<br>/\\\n/g'
