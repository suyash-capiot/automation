#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sort -u -t',' -k5,5 $5/$4/$NOW/*.csv >>ClearTripCountry.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/ClearTrip_ImportCountry.ctl log=$5/$4/$NOW/ClearTripCountry.log bad=$5/$4/$NOW/ClearTripCountry.bad, errors=200000
