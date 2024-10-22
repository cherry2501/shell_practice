#!/bin/bash

MOUNT=(df -hT | grep xfs | aws -F " " '{print $NF}')
STORAGE=(df -hT | grep xfs | aws -F " " '{print $NF}' | cut -d "%" -f1)

echo "$MOUNT"
echo "$STORAGE"