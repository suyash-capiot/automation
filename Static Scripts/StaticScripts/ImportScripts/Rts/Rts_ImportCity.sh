#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k6,6 $5/$4/$NOW/*.csv >>RtsCity.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Rts_city.ctl log=$5/$4/$NOW/RtsCity.log bad=$5/$4/$NOW/RtsCity.bad, errors=10000