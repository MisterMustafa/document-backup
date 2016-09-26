# document-backup
Simple script to backup a document when a change is made.

DEPENDENCIES:
  * md5sum

INSTRUCTIONS

1. Clone the document
$ git clone https://github.com/MisterMustafa/document-backup.git
$ cd document-backup

2. Run the install script
$ chmod +x ./* && ./install.sh

2. Run the setup script

$ backupscript-setup

3. The setup *should* start the script, but if it doesn't, do the following:

SYSTEMD USERS:
$ sudo systemctl enable backupscript@yourusername && sudo systemctl start backupscript@yourusername

NON SYSTEMD:

$ backupscript

If everything went according to plan, you should now be seeing backup copies in the directory you set!

Cygwin specific instructions:

You can access your entire C: Drive through /cygdrive/c

To launch the script as a windows service, launch cygwin as an administrator and do the following:

$ cygrunsrv -I backupscript -p /bin/backupscript
$ net start backupscript
