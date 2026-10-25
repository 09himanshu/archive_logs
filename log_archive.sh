#!/bin/bash

DIRECTORY="$1"

# Login User

echo "================================="
echo "Login User"
who | head -n 1
echo "================================="
echo ""
echo ""

# Os Info

echo "================================="
echo "OS info"
cat /etc/os-release | head -n 3
echo "================================="
echo ""
echo ""

if [ -z "$DIRECTORY" ]; then
  echo "Error: No directory specified."
  exit 1
fi

# Move to log directory /var/log
echo "================================="
echo "Move to log directory /var/log"
cd /var/log
echo "================================="
echo ""
echo ""

# Archive the directory
echo "================================="
echo "Archive the directory"
sudo mkdir -p archive_all_logs
ls -l "$DIRECTORY"
TAR_FILE="$(date +%Y%m%d_%H%M%S).tar.gz"
sudo tar -cvzf "$TAR_FILE" "$DIRECTORY"
sudo mv "$TAR_FILE" archive_all_logs/
echo "================================="
echo ""

