#!/bin/bash
#Call Configuration File
IMPORTSCRIPT=/tmp/Static/StaticScripts/ImportScripts/CommonScripts; export IMPORTSCRIPT
. $IMPORTSCRIPT/Config.sh

#---Import path from Config.sh file---
Oracle_bin=$ORACLE_BIN
echo $Oracle_bin
Oracle_home=$ORACLE_HOME
echo $Oracle_home

cut -d' ' -f7 StaticCronJobs.txt > Suppliernames.txt
#LINE=`cat Suppliernames.txt`
while read LINE; do
if [[ ! -e $LINE ]]; then
#cd path if required
    mkdir -p $LINE
fi
done < Suppliernames.txt