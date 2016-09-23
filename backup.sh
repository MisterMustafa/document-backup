#! /bin/bash

#######################################################
#                                                     #
#       MISTER MUSTAFA'S DOCUMENT BACKUP SCRIPT       #
#                                                     #
#       For any issues or questions or what not       #
#        Just talk to MisterMustafa on IRC, or        #
#              Mister-Mustafa on Reddit.              #
#                                                     #
#       This script backs up current versions of      #
#       documents, only when changes are made to      #
#                       the file.                     #
#                                                     #
#                        GPL V3                       #
#                                                     #
#######################################################

# Please set the following for your document and
# backup directories. Please omit any trailing /'s

backupdir="/path/to/backup/directory"
workfile="/path/to/document.docx" # Use any extension, it's just an example.
docname="Document Name"

while :
do
    # Check to make sure the hash file exists
    if [ ! -f "$backupdir"/hash.md5 ]
        then # Create the hash file.
            md5sum "$workfile" > "$backupdir"/hash.md5;
        else
        :
    fi
    # Now, let's set all our automatic variables.
    md5orig="`md5sum "$workfile" | cut -d ' ' -f 1`"
    md5hash="`cat "$backupdir"/hash.md5`"
    currentdate="`date +%m-%d-%Y`"
    currenttime="`date +%H-%M`"
    # Now, let's check the working file against the hash file.
    if [ "$md5orig" != "$md5hash" ]
        then    #The hash is different! The file has been updated.
            if [ -d "$backupdir"/$currentdate ] #Does the folder for today already exist?
                then    #Folder exists.
                    cp "$workfile" "$backupdir"/$currentdate/"$docname"-backup-$currenttime.docx && # Update the file
                    md5sum "$workfile" | cut -d ' ' -f 1 > "$backupdir"/hash.md5 # Update the hash
                else    #Folder does not exist.
                    mkdir "$backupdir"/$currentdate &&
                    cp "$workfile" "$backupdir"/$currentdate/"$docname"-backup-$currenttime.docx &&
                    md5sum "$workfile" | cut -d ' ' -f 1 > "backupdir"/hash.md5 # Update the hash
            fi
    fi
done