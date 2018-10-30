#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath
NOW=$(date +"%Y%m%d")
echo [$NOW]
sed -i 1d $5/$4/$NOW/*.csv
cd $5/$4/
sort -u -t',' -k1,1 $5/$4/$NOW/*.csv >>ClearCarRental_ImportCarTypes.csv
cd $1
ORACLE_HOME=$2;export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/ClearCarRental_ImportCarTypes.ctl log=$5/$4/$NOW/ClearCarRental_ImportCarTypes.log bad=$5/$4/$NOW/ClearCarRental_ClearCarRental_ImportCarTypes.bad, errors = 10000