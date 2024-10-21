#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME/$TIME_STAMP"

