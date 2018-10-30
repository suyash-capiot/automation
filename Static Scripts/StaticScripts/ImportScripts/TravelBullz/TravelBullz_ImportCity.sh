#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k11,11 $5/$4/$NOW/*.csv >>TravelBullzCity.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/TravelBullz_ImportCity.ctl log=$5/$4/$NOW/TravelBullzCity.log bad=$5/$4/$NOW/TravelBullzCity.bad, errors=10000