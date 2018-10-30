#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sort -u -t',' -k11,11 $5/$4/$NOW/*.csv  >>TheTravellerCity.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/TheTraveller_ImportCity.ctl log=$5/$4/$NOW/TheTravellerCity.log bad=$5/$4/$NOW/TheTravellerCity.bad, errors=10000

