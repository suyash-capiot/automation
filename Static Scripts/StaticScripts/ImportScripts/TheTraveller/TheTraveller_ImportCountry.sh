#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/

sort -u -t',' -k9,9 $5/$4/$NOW/*.csv >>TheTravellerCountry.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/TheTraveller_ImportCountry.ctl log=$5/$4/$NOW/TheTravellerCountry.log bad=$5/$4/$NOW/TheTravellerCountry.bad, errors=10000