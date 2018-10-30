#!/bin/bash
NOW=$(date +"%Y%m%d")
echo [$NOW]
java -Xmx7196m -Xms1024m -XX:+DisableExplicitGC -jar $7/com.coxandkings.utils.files.exec.jar $5/$4/$NOW/*.xlsx  $5/$4/$NOW/

cd $5/$4/
sed -i 1d $5/$4/$NOW/*.csv 
sort -u -t',' -k2,2 $5/$4/$NOW/*.csv >>TravelBullzHotel.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/TravelBullz_ImportHotel.ctl log=$5/$4/$NOW/TravelBullzHotel.log bad=$5/$4/$NOW/TravelBullzHotel.bad, errors=10000
