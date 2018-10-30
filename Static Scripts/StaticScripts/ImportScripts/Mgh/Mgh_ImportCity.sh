#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/City/*.csv
sort -u -t',' -k2,2 $5/$4/$NOW/City/*.csv >>MghCity.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Mgh_ImportCity.ctl log=$5/$4/$NOW/MghCity.log bad=$5/$4/$NOW/MghCity.bad, errors=10000
