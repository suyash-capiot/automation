#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/Country/*.csv
sort -u -t',' -k2,2 $5/$4/$NOW/Country/*.csv >>MghCountry.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Mgh_ImportCountry.ctl log=$5/$4/$NOW/MghCountry.log bad=$5/$4/$NOW/MghCountry.bad, errors=10000

