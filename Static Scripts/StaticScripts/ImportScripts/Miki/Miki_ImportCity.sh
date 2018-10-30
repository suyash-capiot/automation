#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k3,3 $5/$4/$NOW/*.csv >>MikiCity.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/miki_city.ctl log=$5/$4/$NOW/MikiCity.log bad=$5/$4/$NOW/MikiCity.bad, errors=10000