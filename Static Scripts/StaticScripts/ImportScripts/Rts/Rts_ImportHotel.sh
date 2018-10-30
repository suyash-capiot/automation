#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath
echo [$7] #commonScriptPath

NOW=$(date +"%Y%m%d")
echo [$NOW]
java -jar $7/com.coxandkings.utils.files.exec.jar $5/$4/$NOW/*.xlsx  $5/$4/$NOW/
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k7,7 $5/$4/$NOW/*.csv >>RtsHotel.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Rts.ctl log=$5/$4/$NOW/RtsHotel.log bad=$5/$4/$NOW/RtsHotel.bad, errors=10000
