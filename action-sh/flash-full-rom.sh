#!/bin/bash
echo "Checking the integrity of the full rom"
sha1sum -c coreboot.rom.sha1
echo "Backing up current full rom"
sudo ./flashrom -p internal -r backup.rom
echo 'Type "I ACCEPT" if you want to flash rom. This has a chance of unbricking. It is recommended that you copy backup.rom into multiple external storages and online storage such as Google Drive. It is recommended that you have the tool to unbrick your Chromebook in case it gets bricked.'
read -p "Type your answer here: " OUTPUT
if [[ "$OUTPUT" == "I ACCEPT" ]]; then
  echo "Writing to firmware. If the error fails, do not reboot, and you should probably flash the backup firmware."
  sudo ./flashrom -p internal -w backup.rom
else
  echo "Not modifying firmware"
fi
