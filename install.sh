#! /bin/bash

echo "Mister Mustafa's Amazing Backup Script"
echo "GPL V3"
echo
echo "Press enter to begin install."
read
echo
echo "Do you want to install the systemd service? (optional)"
echo
printf "y/n>"
read input
if [ "$input"="y" ]
    then
        sudo sh -c "echo -en '[Unit]\nDescription=Backup Script\n\n[Service]\nUser=$username\nExecStart=/usr/bin/backupscript\nExecReload=/usr/bin/kill backupscript\nKillMode=process\nRestart=always\n\n[Install]\nWantedBy=multi-user.target' > /usr/lib/systemd/system/backupscript\\@.service"
    else
        :
fi
sudo cp ./backupscript /usr/bin
sudo chmod +x /usr/bin/backupscript
sudo cp ./backupscript-setup /usr/bin
sudo chmod +x /usr/bin/backupscript-setup
echo
echo "All done! Now run /usr/bin/backupscript-setup!"
exit 0
