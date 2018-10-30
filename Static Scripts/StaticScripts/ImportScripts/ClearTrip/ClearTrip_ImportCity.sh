#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]

cd $5/$4/
sort -u -t',' -k3,3 $5/$4/$NOW/*.csv >>ClearTripCity.csv

cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control= $6/$4/ctl/ClearTrip_ImportCity.ctl log=$5/$4/$NOW/ClearTripCity.log bad=$5/$4/$NOW/ClearTripCity.bad, errors=200000 