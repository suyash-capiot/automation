#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv
sort -u -t',' -k9,9 $5/$4/$NOW/*.csv >>TravelBullzCountry.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/TravelBullz_ImportCountry.ctl log=$5/$4/$NOW/TravelBullzCountry.log bad=$5/$4/$NOW/TravelBullzCountry.bad, errors=10000
