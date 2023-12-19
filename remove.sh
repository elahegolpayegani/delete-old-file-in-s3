#!/bin/bash
s3cmd ls s3://<path-to-storage>/<sub-directories>/ | awk '{$1=$2=$3=""; print $0}' >  /home/<location-to-save-file>/test.txt
wc=$(cat /home/<location-to-save-file>/test.txt | wc -l)
echo $wc
if [ $wc -ge 9 ]; then
    for VARIABLE in $(cat /home/<location-to-save-file>/test.txt)
       do
         s3cmd del $VARIABLE
         break
 done
fi
