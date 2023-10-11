#!/bin/bash
BUILD_FILE_NAME=$(cat BUILD_FILE_NAME)
echo "Checking the integrity of the full rom"
sha1sum -c $BUILD_FILE_NAME.bin.sha1 || exit 1
echo "Backing up current rwl"
sudo ./flashrom -p internal -i RW_LEGACY -r backup-rwl.bin || exit 1
echo "Type 'y' if you want to flash rwl. If the new rwl doen't work, you may have to use Ctrl+D or Ctrl+U to re-install a working RW_LEGACY. If you do not have ChromeOS installed, it is recommended that you enable booting using Ctrl+U so that you can re-install RW_LEGACY without using a recovery USB."
read -p "Type your answer here: " OUTPUT || exit 1
if [[ "$OUTPUT" == "y" ]]; then
    echo "Writing to firmware"
    sudo ./flashrom -p internal -w -i RW_LEGACY:$BUILD_FILE_NAME.bin || exit 1
else
    echo "Not modifying RW_LEGACY"
fi
