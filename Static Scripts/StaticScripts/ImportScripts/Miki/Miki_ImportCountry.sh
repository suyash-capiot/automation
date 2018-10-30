#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k4,4 $5/$4/$NOW/*.csv  >>MikiCountry.csv

cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/miki_country.ctl log=$5/$4/$NOW/MikiCountry.log bad=$5/$4/$NOW/MikiCountry.bad, errors=10000
