#!/bin/bash

echo "All variables passed to the script: $@"
echo "No.of variables passed to the script: $#"
echo "script name: $0"
echo "present working dir: $pwd"
echo "Home directory: $home"
echo "PID of script execution: $$"
sleep 100 &
echo "PID of last background task: $!"