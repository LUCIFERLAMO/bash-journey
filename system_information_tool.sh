#!/bin/bash

echo "---------------------"
echo "System Information Tool"
echo "---------------------"

echo "Current username: $(whoami)"
echo "Date and time: $(date)"
echo "Operating system: $(uname -s) $(uname -r)"
echo "Disk space:"
df -h /
echo "Memory usage:"
free -m
