#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sort -u -t',' -k11,11 $5/$4/$NOW/*.csv >>AbreuOnlineCountry.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/AbreuOnline_country.ctl log=$5/$4/$NOW/AbreuOnlineCountry.log bad=$5/$4/$NOW/AbreuOnlineCountry.bad