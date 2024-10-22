#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
#MOUNT=$(df -hT | grep xfs | awk -F " " '{print $NF}')
DISK_THRESHOLD=5
#STORAGE=$(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)

while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    echo "Deleting file: $line"
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        echo "$PARTITION is more than $DISK_THRESHOLD, current value:$USAGE... check it"
    fi
done <<< $DISK_USAGE