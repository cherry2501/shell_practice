#!/bin/bash

MOUNT=(df -hT | grep xfs | awk -F " " '{print $NF}')
STORAGE=(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)

echo "$MOUNT"
echo "$STORAGE"