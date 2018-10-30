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
sort -u -t'|' -k6,6 $5/$4/$NOW/*.txt>>AtiCity.txt
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control= $6/$4/ctl/Ati_city.ctl log=$5/$4/$NOW/AtiCity.log bad=$5/$4/$NOW/AtiCity.bad, errors=23000
