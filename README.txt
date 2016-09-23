# document-backup
Simple script to backup a document when a change is made.

This shell script is for Bash, but I'm successfully using it on Cygwin, so here are some instructions for that:

1. Install Cygwin (https://www.cygwin.com/) and make sure to include md5sum and cygrunsrv
2. Save the script to C:\cygwin\bin and run "chmod +x /bin/backup.sh" from a cygwin console.
3. Edit the script with nano or vi (nano is easier) using "nano /bin/backup.sh". Make sure to follow the instructions and change the values of "backupdir", "workfile" and "docname".
4. Test the script before installing as a service. Just type /bin/backup.sh, if there is no output, it's running fine!
5. Install the script as a service with "cygrunsrv -I backup -p /bin/backup.sh"
6. Start the service with "net start backup"

If everything went according to plan, you should now be seeing backup copies in the directory you set!

Linux Instructions:

If you're using Linux, and you need help on how to run a shell script, I can't help you man! ;)
