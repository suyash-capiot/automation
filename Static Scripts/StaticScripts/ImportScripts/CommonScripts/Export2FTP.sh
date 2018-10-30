#!/bin/sh

#Call Configuration File
IMPORTSCRIPT=/tmp/Static/StaticScripts/ImportScripts/CommonScripts; export IMPORTSCRIPT
. $IMPORTSCRIPT/Config.sh

#---Import path from Config.sh file---
Oracle_bin=$ORACLE_BIN
echo $Oracle_bin
Oracle_home=$ORACLE_HOME
echo $Oracle_home
accoPath=$ACCO
echo $accoPath


#------connection-------
cd $Oracle_bin
ORACLE_HOME=$Oracle_home; export ORACLE_HOME

NOW=`date +"%Y%m%d"`
cd $accoPath
if [ -d "$NOW" ]
then
tar -czvf $NOW.tar.gz $accoPath/$NOW
fi

#-----Credentials---------
HOST='10.21.21.215'
USER='Jacob'
PASSWD='Jacob'
#------File-------
NOW=`date +"%Y%m%d"`
FILE='$NOW'

#----Connecting to Remote----
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
cd "Demo" #----RemoteServerPath-----
lcd "$accoPath" #------LocalPath-----
mput *.*
#------put $FILE------
quit
END_SCRIPT
exit 0